%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizada cumpliendo los siguientes parametros:<p>Busqueda en {{sit}} teniendo como tipo de lugar {{lug}} en una apertura de radio de {{rad}}</p></h1>
<br>

	% for a,e in zip(nombre,calle):
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>
		<br>
	%end
%include('footer.tpl')