from flask import Flask, flash, render_template, request, redirect, json
import os
import urllib.request
from jinja2 import ext
from datetime import datetime

app = Flask(__name__)

with urllib.request.urlopen("https://apis.is/petrol") as url:
    gogn = json.loads(url.read().decode())

def format_time(gogn):
    return datetime.strptime(gogn, '%Y-%m-%dT%H:%M:%S.%f').strftime('%d. %B. %Y. Tími %H:%M')

app.jinja_env.add_extension(ext.do)

app.jinja_env.filters['format_time'] = format_time

def minPetrol():
    minPetrolPrice = 1000
    company = None
    address = None
    lst = gogn['results']
    for i in lst:
        if i['bensin95'] is not None:
            if i['bensin95'] < minPetrolPrice:
                minPetrolPrice = i['bensin95']
                company = i['company']
                address = i['name']
    return [minPetrolPrice, company, address]


def minDiesel():
    minDieselPrice = 1000
    company = None
    address = None
    lst = gogn['results']
    for i in lst:
        if i['diesel'] is not None:
            if i['diesel'] < minDieselPrice:
                minDieselPrice = i['diesel']
                company = i['company']
                address = i['name']
    return [minDieselPrice, company, address]


@app.route('/')
def index():
    return render_template("index.tpl", gogn=gogn,minP=minPetrol(), minD=minDiesel()  )

@app.route("/company/<company>")
def com(company):
    return render_template("company.tpl", gogn=gogn,com=company)

@app.route("/moreinfo/<key>")
def info(key):
    return render_template("moreinfo.tpl", gogn=gogn,k=key)

@app.errorhandler(404)
def pagenotfound(error):
    return render_template("pagenotfound.tpl"), 404

if __name__ == '__main__':
    app.run()
    #app.run(debug=True, use_reloader=True)