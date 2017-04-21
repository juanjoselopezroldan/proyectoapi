%include('header.tpl')

<img src="static/style/1.jpg" width="800" height="400" border="1" align="center" />
<br>
<br>
<div align="rigth">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/>
		Lugar:
							<select name="lugar">
								<option value="restaurant">Restaurante</option>
								<option value="museum">Museo</option>
								<option value="shopping_mall">Centro comercial</option>
								<option value="movie_theater">Cine</option>
								<option value="hospital">Hospital</option>
								<option value="police">Policia</option>
							</select>
		<label> Radio (metros):</label>
		<input type="text" name="radio" required/>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')