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
	key="AIzaSyBjWDRtMKtmvWpivRoLhA36w4TA6Rzxt70"
	sit = request.forms.get('sitio')
	lug = request.forms.get('lugar')
	rad = request.forms.get('radio')
	urlbase="https://maps.googleapis.com/maps/api/"
	payload={"address":sit,"sensor":"false"}
	r=requests.get(urlbase+"geocode/json",params=payload)
	if r.status_code == 200:
		js=json.loads(r.text)
		for i in js["results"]:
			lat=i["geometry"]["location"]["lat"]
			lng=i["geometry"]["location"]["lng"]
		lat_long=str(lat)+","+str(lng)
		payload2={"location":lat_long,"language":"es","radius":rad,"types":lug,"keyword":"cruise","sensor":"false","key":key,"libraries":"places"}
		r2=requests.get(urlbase+"place/nearbysearch/json",params=payload2)

		nombres=[]
		calles=[]
		if r2.status_code==200:
			js2=json.loads(r2.text)
			for i2 in js2["results"]:
				nombres.append(i2["name"])
				calles.append(i2["vicinity"])
		return template('template2.tpl', sit=sit, lug=lug, rad=rad, nombre=nombres, calle=calles)

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

if __name__ == '__main__':
	run(host='0.0.0.0',port=argv[1])