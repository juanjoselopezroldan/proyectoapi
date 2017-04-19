%include('header.tpl')
<div align="center">
<img src="static/style/1.jpg" width="500" height="200" />
<br>
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