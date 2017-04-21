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
	key="AIzaSyAlzpHRWdL4ARb0BGSGZk2RfL59o86jg2Y"
	sit = request.forms.get('sitio')
	rad = request.forms.get('radio')
	urlbase="http://maps.googleapis.com/maps/api/"
	payload={"address":sit,"sensor":"false"}
	r=requests.get(urlbase+"geocode/json",params=payload)
	if r.status_code == 200:
		js=json.loads(r.text)
		for i in js["results"]:
			lat=i["geometry"]["location"]["lat"]
			lng=i["geometry"]["location"]["lng"]
		lat_long=str(lat)+","+str(lng)
		payload2={"location":lat_long,"language":"es","radius":rad,"types":"restaurant","keyword":"cruise","sensor":"false","key":key}
		r2=requests.get(urlbase+"place/nearbysearch/json",params=payload2)

		if r2.status_code==200:
			js2=json.loads(r2.text)
		return template('template2.tpl', titulo=js2)

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

if __name__ == '__main__':
	run(host='0.0.0.0',port=argv[1])