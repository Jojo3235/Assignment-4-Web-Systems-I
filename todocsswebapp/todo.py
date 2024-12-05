import sqlite3
from bottle import route, run, debug, template, request, static_file, error

@route('/')
@route('/todo')
def todo_list():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1';")
    result = c.fetchall()
    c.close()
    output = template('templates/make_table', rows=result)
    return output

@route('/new', method='GET')
def new_item():
    if request.GET.get('save','').strip():
        new = request.GET.get('task', '').strip()
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("INSERT INTO todo (task,status) VALUES (?,?)", (new,1))
        new_id = c.lastrowid
        conn.commit() 
        c.close() 
        return template('templates/message', 
            message='The new task was inserted into the database, the ID is %s' % new_id, 
            title='New task added!') 
    else:
        return template('templates/new_task.tpl')

@route('/edit/:no', method='GET')
def edit_item(no):
    if request.GET.get('save','').strip():
        edit = request.GET.get('task','').strip()
        status = request.GET.get('status','').strip()
        if status == 'open':
            status = 1
        else:
            status = 0
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("UPDATE todo SET task = ?, status = ? WHERE id LIKE ?", (edit,status,no))
        conn.commit()
        return template('templates/message', message='The item number %s was successfully updated' % no, title='Task updated')
    else:
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no),))
        cur_data = c.fetchone()
        return template('templates/edit_task', old = cur_data, no = no)

@route('/item:item#[0-9]+#')
def show_item(item):
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (item,))
        result = c.fetchone()
        c.close()
        if not result:
            return template('templates/message', message='This item number does not exist!', title='Error')
        else:
            return template('templates/message', message='Task: %s' % result[0] , title='Show task')

@route('/help')
def help():
    return static_file('help.html', root='.')

@route('/css/:filename', name='css')
def server_static(filename):
    return static_file(filename, root='./css')

@error(403)
def mistake403(code):
    return template('templates/message', message='There is a mistake in your url!', title='Error 403')

@error(404)
def mistake404(code):
    return template('templates/message', message='Sorry, this page does not exist!', title='Error 404')

# remember to remove reloader=True and debug(True) when you move your application 
# from development to a productive environment
debug(True)
run(host='localhost', port=8080)
