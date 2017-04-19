%include('header.tpl')
<br>
	<form action="/map" method="post">
		<label>Sitio (Calle/Lugar"ej: Cineapolis dos hermanas"):</label>
		<input type="text" name="Sitio" required/>
		<label>Radio (Def. en metros):</label>
		<input type="text" name="Radio" required/>
		<input type="submit" value="Buscar">
	</form>
<br>
%include('footer.tpl')