%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e in zip(nombre,calle):
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>
		<br>
	%end
%include('footer.tpl')