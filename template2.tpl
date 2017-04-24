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
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: {{la}}, lng: {{lo}}},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjWDRtMKtmvWpivRoLhA36w4TA6Rzxt70&callback=initMap"
    async defer></script>


		<br>
	%end
	<p>{{js2}}</p>
%include('footer.tpl')