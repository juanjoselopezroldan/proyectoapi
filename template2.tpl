%include('header.tpl')
<h1>Estos son los resultados de la busqueda realizados cumpliendo los parametros introducidos:</h1>
<h4>Numero de resultados encontrados: {{cont}}</h4>
<br>

	% for a,e,c,la,lo in zip(nombre,calle,cont2,latitud,longitud):
	<h6>Resultado numero {{c}}</h6>
		<li>Nombre: {{a}}</li>
		<li>Calle: {{e}}</li>
		<h3>{{a}}</h3>
    	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBjWDRtMKtmvWpivRoLhA36w4TA6Rzxt70"></script>
    <script>
      // In the following example, markers appear when the user clicks on the map.
      // Each marker is labeled with a single alphabetical character.
      var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      var labelIndex = 0;

      function initialize() {
        var bangalore = { lat: {{la}}, lng: {{lo}}} };
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: bangalore
        });

        // This event listener calls addMarker() when the map is clicked.
        google.maps.event.addListener(map, 'click', function(event) {
          addMarker(event.latLng, map);
        });

        // Add a marker at the center of the map.
        addMarker(bangalore, map);
      }

      // Adds a marker to the map.
      function addMarker(location, map) {
        // Add the marker at the clicked location, and add the next-available label
        // from the array of alphabetical characters.
        var marker = new google.maps.Marker({
          position: location,
          label: labels[labelIndex++ % labels.length],
          map: map
        });
      }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>

	%end
	<h1>Mapa de la ciudad donde que se esta realizando la busqueda.</h1>
	<iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d12698.178238023742!2d{{longitud}}!3d{{latitud}}!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2ses!4v1492853273775" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	<p>{{js2}}</p>
%include('footer.tpl')