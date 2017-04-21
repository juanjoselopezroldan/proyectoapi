%include('header.tpl')

<img src="static/style/1.jpg" width="400" height="200" border="1" align="left" />
<br>
<br>
<div align="rigth">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/><br>
		Lugar:
							<select name="lugar">
								<option value="restaurant">Restaurante</option>
								<option value="museum">Museo</option>
								<option value="shopping_mall">Centro comercial</option>
								<option value="movie_theater">Cine</option>
								<option value="hospital">Hospital</option>
								<option value="police">Policia</option>
							</select><br>
		<label> Radio (metros):</label>
		<input type="text" name="radio" required/><br>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')