%include('header.tpl')

<img src="static/style/1.jpg" width="400" height="400" border="15" align="left" />
<br>
<br>
<div align="rigth">

	<form action="/map" method="post">
		<label>Sitio:</label>
		<input type="text" name="sitio" required/><br>
		<label> Radio (metros):</label>
		<input type="number" min='1' name="radio" required/><br>
		Lugar:
							<select name="lugar">
								<option value="restaurante">Restaurantes</option>
								<option value="establecimiento">Establecimientos</option>
								<option value="museo">Museos</option>
								<option value="Sitios de interes">Sitios de interes</option>
								<option value="cine">Cines</option>
								<option value="stadium">Estadios</option>
								<option value="centro comercial">Centro comerciales</option>
								<option value="parque">Parques</option>
							</select><br><br><br>
		<input type="submit" value="Buscar">
	</form>

</div>
<br>
%include('footer.tpl')