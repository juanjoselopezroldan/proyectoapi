%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,c,la,lo in zip(nombre,calle,cont2,latitud,longitud):
	<h4>Resultado numero {{c}}</h4>
		<h5>Nombre: {{a}}</h5>
		<h6>Calle: {{e}}</h6>
		<b><h5>Pincha en la imagen del mapa para asi acceder al mapa</h5></b>
		<a href="https://www.google.es/maps/@{{la}},{{lo}},20z?hl=es"><img src="https://maps.googleapis.com/maps/api/staticmap?center={{la}}, {{lo}}&zoom=17&size=400x400&maptype=roadmap&key=AIzaSyBjWDRtMKtmvWpivRoLhA36w4TA6Rzxt70"></a>
		<br>
		<br>
	%end
	% if siguiente!="nada":
		<form action="/map/token" method="post" style="float: left">
			<input type="hidden" name="next" value="{{siguiente}}">
			<input type="submit" value="siguiente">
		</form>
	%end
	<br>
	{{js2}}
%include('footer.tpl')
