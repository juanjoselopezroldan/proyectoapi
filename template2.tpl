%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,f in zip(nombre,calle,foto):
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>
		<li><a href="{{f}}">Enlace de imagenes del lugar</a></li>
		<br>
	%end
	<h1>Mapa de la ciudad donde que se esta realizando la busqueda.</h1>
	<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d12698.178238023742!2d{{longitud}}!3d{{latitud}}!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1492853273775" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	{{js2}}
%include('footer.tpl')