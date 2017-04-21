%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizada cumpliendo los siguientes parametros:<h2>Busqueda en {{sit}} teniendo como tipo de lugar {{lug}} en una apertura de radio de {{rad}} Metros</p></h2>
<br>

	% for a,e in zip(nombre,calle):
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>
		<br>
	%end
%include('footer.tpl')