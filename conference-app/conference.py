from bottle import route, run, template, debug, request, static_file, redirect
import sqlite3, os

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
    conn  = sqlite3.connect('./conference-app/conference.db')
    c = conn.cursor()
    c.execute("SELECT * FROM speakers ORDER BY 3;")
    result = c.fetchall()
    c.close()
    return template("./conference-app/templates/speakers.tpl", rows = result)

@route("/register.html")
def register():
    return template("./conference-app/templates/register.tpl")


@route('/assets/stylesheets/:filename', name='css')
def stylesheets(filename):
    return static_file(filename, root='./conference-app/assets/stylesheets')

@route('/assets/images/:page/:filename', name='css')
def images(page, filename):
    return static_file(filename, root='./conference-app/assets/images/' + page)

@route('/admin/tickets')
def admin_tickets():
    conn = sqlite3.connect('./conference-app/conference.db')
    c = conn.cursor()
    c.execute("SELECT * FROM tickets ORDER BY 1 DESC;")
    result = c.fetchall()
    c.close()
    return template("conference-app/templates/admin/tickets.tpl", rows = result)

@route('/admin/tickets', method="POST")
def admin_tickets_create():
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
        redirect('/admin/tickets') 

@route('/admin/speakers')
def admin_speakers():
    conn  = sqlite3.connect('./conference-app/conference.db')
    c = conn.cursor()
    c.execute("SELECT * FROM speakers ORDER BY 3;")
    result = c.fetchall()
    c.close()
    return template("conference-app/templates/admin/speakers.tpl", rows = result)

@route('/admin/speakers', method="POST")
def admin_speakers_create():
    if request.forms.submit:
        firstname = request.forms.firstname
        lastname = request.forms.lastname
        tagline = request.forms.tagline
        description = request.forms.description
        bio = request.forms.bio
        website = request.forms.website
        twitter = request.forms.twitter
        upload = request.files.get('upload')
        if upload:
            name, ext = os.path.splitext(upload.filename)
            if ext not in ('.jpg'):
                return "File extension not allowed."
            # upload image to the assets speakers folder
            upload.save('./conference-app/assets/images/speakers/'+firstname+"-"+lastname+ext, overwrite=True)
        conn = sqlite3.connect('./conference-app/conference.db')
        c = conn.cursor()
        c.execute("SELECT COUNT(*) FROM speakers")
        rows = c.fetchone()[0] +1
        c.execute("INSERT INTO speakers (id, firstname, lastname, tagline, description, bio, website, twitter) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", (rows, firstname, lastname, tagline, description, bio, website, twitter))
        conn.commit()
        c.close()
        redirect('/admin/speakers')

@route('/admin/speakers/:id')
def admin_speaker(id):
    conn  = sqlite3.connect('./conference-app/conference.db')
    c = conn.cursor()
    c.execute("SELECT * FROM speakers WHERE id = ?", (str(id)))
    result = c.fetchone()
    c.close()
    return template("conference-app/templates/admin/speaker.tpl", row = result)


@route('/admin/speakers/:id', method="POST")
def admin_speaker_update(id):
    if request.forms.submit:
        firstname = request.forms.firstname
        lastname = request.forms.lastname
        tagline = request.forms.tagline
        description = request.forms.description
        bio = request.forms.bio
        website = request.forms.website
        twitter = request.forms.twitter
        upload = request.files.get('upload')
        if upload:
            name, ext = os.path.splitext(upload.filename)
            if ext not in ('.jpg'):
                return "File extension not allowed."
            # upload image to the assets speakers folder
            upload.save('./conference-app/assets/images/speakers/'+firstname+"-"+lastname+ext, overwrite=True)
        conn = sqlite3.connect('./conference-app/conference.db')
        c = conn.cursor()
        c.execute("UPDATE speakers SET firstname = ?, lastname = ?, tagline = ?, description = ?, bio = ?, website = ?, twitter = ? WHERE id = ?", (firstname, lastname, tagline, description, bio, website, twitter, id))
        conn.commit()
        c.close()
        redirect('/admin/speakers')


@route('/admin/speakers/:id/delete')
def admin_speaker_delete(id):
    conn = sqlite3.connect('./conference-app/conference.db')
    c = conn.cursor()
    c.execute("SELECT * FROM speakers WHERE id = ?", (str(id)))
    result = c.fetchone()
    name = result[1]+"-"+result[2]
    c.execute("DELETE FROM speakers WHERE id = ?", (str(id)))
    conn.commit()
    c.close()
    os.remove('./conference-app/assets/images/speakers/'+name+'.jpg')
    redirect('/admin/speakers')


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