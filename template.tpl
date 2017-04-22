%include('header.tpl')

<img src="static/style/1.jpg" width="400" height="200" border="1" align="left" />
<br>
<br>
<div align="rigth">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/><br>
		<label> Radio (metros):</label>
		<input type="text" name="radio" required/><br>
		Lugar:
							<select name="lugar">
								<option value="restaurant">Restaurantes</option>
								<option value="museum">Museos</option>
								<option value="shopping_mall">Centro comerciales</option>
								<option value="movie_theater">Cines</option>
								<option value="airport">Aeropuertos</option>
								<option value="university">Universidades</option>
								<option value="establishment">Establecimientos</option>
								<option value="school">Colegios</option>
								<option value="store">Tiendas</option>
								<option value="point_of_interest">Sitios de interes</option>
							</select><br><br><br>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')