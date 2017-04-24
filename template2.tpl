%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,c,la,lo in zip(nombre,calle,cont2,latitud,longitud):
	<h6>Resultado numero {{c}}</h6>
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>

		<h3>{{a}}</h3>
    	<div id="map"></div>
    	<script>
      	function initMap() {
        var uluru = {lat: {{la}}, lng: {{lo}} };
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
        }
    	</script>
    	<script async defer
    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjWDRtMKtmvWpivRoLhA36w4TA6Rzxt70&callback=initMap">
   		 </script>


		<br>
	%end
	<h1>Mapa de la ciudad donde que se esta realizando la busqueda.</h1>
	<p>{{js2}}</p>
%include('footer.tpl')