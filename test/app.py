import os
import socket
from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'RDS URL'
app.config['MYSQL_USER'] = 'test'
app.config['MYSQL_PASSWORD'] = 'test'
app.config['MYSQL_DB'] = 'test'
mysql = MySQL(app)

@app.route("/", methods=['GET', 'POST'])
def hello():

    html = "<h3>Hello {name}!</h3>" \
           "<b>Hostname:</b> {hostname}<br/>" \
           "<b>Visits:</b> {visits}" 
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname(), visits=index())


def index():
	cur = mysql.connection.cursor()
	cur.execute('''SELECT data FROM example WHERE id = 1''')
	rv = cur.fetchall()
	return str(rv)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)