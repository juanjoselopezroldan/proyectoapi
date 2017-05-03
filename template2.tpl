%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados en esta pagina: {{cont}}</h4>
<br>
	% for a,e,c,la,lo in zip(nombre,calle,cont2,latitud,longitud):
	<h4>Resultado numero {{c}}</h4>
		<h5>Nombre: {{a}}</h5>
		<h6>Calle: {{e}}</h6>
		<h5><b> ↓ <u>Pincha en la imagen del mapa para asi acceder al mapa</u> ↓ </b></h5>
		<a href="https://www.google.es/maps/@{{la}},{{lo}},20z?hl=es"><img src="https://maps.googleapis.com/maps/api/staticmap?center={{la}}, {{lo}}&zoom=17&size=400x400&maptype=roadmap&key={{clave}}"></a>
		<br>
		<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d12698.178238023742!2d{{lo}}!3d{{la}}!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1493801575504" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		<br>
	%end
	% if siguiente!="nada":
		<form action="/map" method="get">
			<input type="hidden" name="spag" value="{{siguiente}}">
			<input type="submit" value="siguiente">
		</form>
	%end
	<br>
%include('footer.tpl')