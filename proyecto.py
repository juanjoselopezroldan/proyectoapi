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
	key="AIzaSyBFRrsWet-kt-RxnkWVpUdeZ7ep4s1hdNc"
	sit = request.forms.get('sitio')
	rad = request.forms.get('radio')
	urlbase="http://maps.googleapis.com/maps/api/"
	payload={"address":sit,"sensor":"false"}
	r=requests.get(urlbase+"geocode/json",params=payload)
	if r.status_code == 200:
		js=json.loads(r.text)
		for i in js["location"]
			a=i["lat"]
			b=i["lng"]
		return template('template2.tpl', titulo=a, otro=b)

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

if __name__ == '__main__':
	run(host='0.0.0.0',port=argv[1])