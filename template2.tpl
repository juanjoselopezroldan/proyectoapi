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
		 <form action="/twitter" method="post">
            <input type="hidden" name="url" value="https://www.google.es/maps/@{{la}},{{lo}},20z"/>
            <p><input type="submit" class="button" value="Compartir Via Twitter" /></p>
        </form>       
		<br>
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