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
	key=os.environ['key']
	sit = request.forms.get('sitio')
	lug = request.forms.get('lugar')
	rad = request.forms.get('radio')
	rad1 =int(rad*100)
	urlbase="https://maps.googleapis.com/maps/api/"
	payload={"address":sit,"sensor":"false"}
	r=requests.post(urlbase+"geocode/json",params=payload)
	if r.status_code == 200:
		js=json.loads(r.text)
		for i in js["results"]:
			lat=i["geometry"]["location"]["lat"]
			lng=i["geometry"]["location"]["lng"]
		lat_long=str(lat)+","+str(lng)
		payload2={"location":lat_long,"language":"es","radius":rad1,"query":lug,"keyword":"cruise","sensor":"false","key":key}
		r2=requests.post(urlbase+"place/textsearch/json",params=payload2)
		cont=1
		cont2=[1]
		nombres=[]
		calles=[]
		latitud=[]
		longitud=[]
		siguiente="nada"
		if r2.status_code==200:
			js2=json.loads(r2.text)
			if js2.has_key("next_page_token"):
				siguiente=js2["next_page_token"]
			for i2 in js2["results"]:
				cont=cont+1
				cont2.append(cont)
				nombres.append(i2["name"])
				calles.append(i2["formatted_address"])
				latitud.append(i2["geometry"]["location"]["lat"])
				longitud.append(i2["geometry"]["location"]["lng"])
			cont=cont-1
		return template('template2.tpl', siguiente=siguiente, latitud=latitud, longitud=longitud, nombre=nombres, calle=calles, cont=cont, cont2=cont2, clave=key)		

@route('/map',method="get")
def resultado2():
	token=request.query.spag
	key=os.environ['key']
	urlbase="https://maps.googleapis.com/maps/api/"
	payload2={"key":key,"pagetoken":token}
	r2=requests.get(urlbase+"place/textsearch/json",params=payload2)
	cont=1
	cont2=[1]
	nombres=[]
	calles=[]
	latitud=[]
	longitud=[]
	siguiente="nada"
	if r2.status_code==200:
		js2=json.loads(r2.text)
		if js2.has_key("next_page_token"):
			siguiente=js2["next_page_token"]
		for i2 in js2["results"]:
			cont=cont+1
			cont2.append(cont)
			nombres.append(i2["name"])
			calles.append(i2["formatted_address"])
			latitud.append(i2["geometry"]["location"]["lat"])
			longitud.append(i2["geometry"]["location"]["lng"])
		cont=cont-1
	return template('template2.tpl', siguiente=siguiente, latitud=latitud, longitud=longitud, nombre=nombres, calle=calles, cont=cont, cont2=cont2, clave=key)


@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')

if __name__ == '__main__':
	run(host='0.0.0.0',port=argv[1])