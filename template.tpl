%include('header.tpl')

<img src="static/style/1.jpg" width="800" height="400" border="1" align="center" />
<br>
<br>
<div align="center">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/>
		<label> Radio (metros):</label>
		<input type="text" name="radio" required/>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')