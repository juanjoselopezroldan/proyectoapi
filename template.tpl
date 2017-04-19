%include('header.tpl')
<br>
	<form action="/map" method="post">
		<label>Sitio (ej: Factory Sevilla):</label>
		<input type="text" name="sitio" required/>
		<label> Radio (En metros):</label>
		<input type="text" name="radio" required/>
		<input type="submit" value="Buscar">
	</form>
<br>
%include('footer.tpl')