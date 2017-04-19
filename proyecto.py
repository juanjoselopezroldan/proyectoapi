import bottle
from bottle import Bottle,route,run,request,template,static_file
import json
import os
from sys import argv
import requests

@route('/',method="get")
def inicio():
	    return template ('template.tpl')

@route('/map',method="post")
def resultado():
	sitio = request.forms.get('sitio')
    radio = request.forms.get('radio')
    key="AIzaSyBFRrsWet-kt-RxnkWVpUdeZ7ep4s1hdNc"
    urlbase="http://maps.googleapis.com/maps/api/"
    payload={"address":sitio,"sensor":"false"}
    r=requests.get(urlbase+"geocode/json",params=payload)
    print r
    print r.status_code
    if r.status_code == 200:
    	js=json.loads(r.text)
    
@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

if __name__ == '__main__':
	run(host='0.0.0.0',port=argv[1])