from bottle import route, run, template, debug, request, static_file
import sqlite3

@route("/")
@route("/index.html")
def index():
    return template("./conference-app/templates/index.tpl")

@route("/schedule.html")
def schedule():
    return template("./conference-app/templates/schedule.tpl")

@route("/venue.html")
def venue():
    return template("./conference-app/templates/venue.tpl")

@route("/speakers.html")
def speakers():
    return template("./conference-app/templates/speakers.tpl")

@route("/register.html")
def register():
    return template("./conference-app/templates/register.tpl")


@route('/assets/stylesheets/:filename', name='css')
def stylesheets(filename):
    return static_file(filename, root='./conference-app/assets/stylesheets')

@route('/assets/images/:page/:filename', name='css')
def images(page, filename):
    return static_file(filename, root='./conference-app/assets/images/' + page)

@route("/register.html", method="POST")
def checkout():
    if request.forms.submit:
        name = request.forms.name
        email = request.forms.email
        quantity = request.forms.quantity
        comments = request.forms.comments
        conn = sqlite3.connect('./conference-app/conference.db')
        c = conn.cursor()
        #calcular numero de filas
        c.execute("SELECT COUNT(*) FROM tickets")
        rows = c.fetchone()[0] +1
        c.execute("INSERT INTO tickets (id, name, email, quantity, comments) VALUES (?, ?, ?, ?, ?)", (rows, name, email, quantity, comments))
        conn.commit()
        c.close()
    return '{name: %s, email: %s, quantity: %s, comments: %s}' % (name, email, quantity, comments)

debug(True)
run(host="localhost", port=8080, reloader=True)