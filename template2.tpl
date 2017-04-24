%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,c in zip(nombre,calle,cont2):
	<h4>Resultado numero {{c}}</h4>
		<h5>Nombre: {{a}}</h5>
		<h6>Calle: {{e}}</h6>
		<br>
	%end
	<p>{{js2}}</p>
%include('footer.tpl')