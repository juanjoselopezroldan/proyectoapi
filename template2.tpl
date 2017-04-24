%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,c in zip(nombre,calle,cont2):
	<h6>Resultado numero {{c}}</h6>
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>

		<br>
	%end
	<h1>Mapa de la ciudad donde que se esta realizando la busqueda.</h1>
	<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d12698.178238023742!2d{{longitud}}!3d{{latitud}}!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1492853273775" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	<p>{{js2}}</p>
%include('footer.tpl')