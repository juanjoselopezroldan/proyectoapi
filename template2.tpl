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
	
	{{js2}}
%include('footer.tpl')