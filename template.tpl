%include('header.tpl')

<img src="static/style/1.jpg" width="400" height="400" border="15" align="bottom" />
<br>
<br>
<div align="rigth">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/><br>
		<label>Tipo:</label>
		<input type="text" name="lugar" required/><br>
		<label> Radio (metros):</label>
		<input type="number" min='1' name="radio" required/><br>
		<br><br><br>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')