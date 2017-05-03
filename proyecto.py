import bottle
from bottle import Bottle,route,run,request,template,static_file,redirect,get,post,default_app,response,get,post
import json
import os
from sys import argv
import requests
from requests_oauthlib import OAuth1
from requests_oauthlib import OAuth2Session
from oauthlib.oauth2 import TokenExpiredError
from urlparse import parse_qs

#Parte de twitter

REQUEST_TOKEN_URL = "https://api.twitter.com/oauth/request_token"
AUTHENTICATE_URL = "https://api.twitter.com/oauth/authenticate?oauth_token="
ACCESS_TOKEN_URL = "https://api.twitter.com/oauth/access_token"
CONSUMER_KEY = os.environ["CONSUMER_KEY"]
CONSUMER_SECRET = os.environ["CONSUMER_SECRET"]
TOKENS = {}


def get_request_token():
    oauth = OAuth1(CONSUMER_KEY,
    				client_secret=CONSUMER_SECRET,
	)
    r = requests.post(url=REQUEST_TOKEN_URL, auth=oauth)
    credentials = parse_qs(r.content)
    TOKENS["request_token"] = credentials.get('oauth_token')[0]
    TOKENS["request_token_secret"] = credentials.get('oauth_token_secret')[0]
    
def get_access_token(TOKENS):
  
  oauth = OAuth1(CONSUMER_KEY,
                   client_secret=CONSUMER_SECRET,
                   resource_owner_key=TOKENS["request_token"],
                   resource_owner_secret=TOKENS["request_token_secret"],
                   verifier=TOKENS["verifier"],)
  
  
  r = requests.post(url=ACCESS_TOKEN_URL, auth=oauth)
  credentials = parse_qs(r.content)
  TOKENS["access_token"] = credentials.get('oauth_token')[0]
  TOKENS["access_token_secret"] = credentials.get('oauth_token_secret')[0]

#Parte de buscador

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
		payload2={"location":lat_long,"language":"es","radius":rad,"query":lug,"keyword":"cruise","sensor":"false","key":key}
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


#Parte de twitter
@post('/twitter')
def twitter():
    get_request_token()
    url=request.forms.get("url")
    response.set_cookie("url", url,secret='some-secret-key')
    authorize_url = AUTHENTICATE_URL + TOKENS["request_token"]
    response.set_cookie("request_token", TOKENS["request_token"],secret='some-secret-key')
    response.set_cookie("request_token_secret", TOKENS["request_token_secret"],secret='some-secret-key')
    redirect (authorize_url)

@get('/callback')

def get_verifier():
  TOKENS["request_token"]=request.get_cookie("request_token", secret='some-secret-key')
  TOKENS["request_token_secret"]=request.get_cookie("request_token_secret", secret='some-secret-key')
  TOKENS["verifier"] = request.query.oauth_verifier
  get_access_token(TOKENS)
  response.set_cookie("access_token", TOKENS["access_token"],secret='some-secret-key')
  response.set_cookie("access_token_secret", TOKENS["access_token_secret"],secret='some-secret-key')
  redirect('/twittear')


@get('/twittear')
def twittear():
    if request.get_cookie("url", secret='some-secret-key'):
      url=request.get_cookie("url", secret='some-secret-key')
    else:
      url="no tengo resultado"

    if request.get_cookie("access_token", secret='some-secret-key'):
      TOKENS["access_token"]=request.get_cookie("access_token", secret='some-secret-key')
      TOKENS["access_token_secret"]=request.get_cookie("access_token_secret", secret='some-secret-key')
      return template('twitter.tpl',url=url) 
    else:
      redirect('/twitter')


@post('/twittear')
def tweet_submit():
  texto = request.forms.get("tweet")
  TOKENS["access_token"]=request.get_cookie("access_token", secret='some-secret-key')
  TOKENS["access_token_secret"]=request.get_cookie("access_token_secret", secret='some-secret-key')
  print CONSUMER_KEY
  print CONSUMER_SECRET
  print TOKENS["access_token"]
  print TOKENS["access_token_secret"]
  oauth = OAuth1(CONSUMER_KEY,
                   client_secret=CONSUMER_SECRET,
                   resource_owner_key=TOKENS["access_token"],
                   resource_owner_secret=TOKENS["access_token_secret"])
  url = 'https://api.twitter.com/1.1/statuses/update.json'
  r = requests.post(url=url,
                      data={"status":texto},
                      auth=oauth)
  if r.status_code == 200:
    return "<p>Tweet properly sent</p>"
  else:
    return "<p>Unable to send tweet</p>"+r.content

@get('/twitter_logout')
def twitter_logout():
  response.set_cookie("access_token", '',max_age=0)
  response.set_cookie("access_token_secret", '',max_age=0)
  redirect('/twitter')


@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root='static')


run(host='0.0.0.0',port=argv[1])