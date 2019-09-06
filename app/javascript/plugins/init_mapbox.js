import mapboxgl from 'mapbox-gl';

const initMapbox = () => {

  const mapElement = document.getElementById('map');


  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    if (mapElement.dataset.marker){ // if there is one work order (show)
      const marker = JSON.parse(mapElement.dataset.marker);
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        center: [marker.lng, marker.lat],
        zoom: 15
      });
      // markers.forEach((marker) => {
      //   new mapboxgl.Marker()
      //     .setLngLat([ marker.lng, marker.lat ])
      //     .addTo(map);
      // });


      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '48px';
      element.style.height = '75px';



      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .addTo(map);

      } else {
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          zoom: 15
        });
        const markers = JSON.parse(mapElement.dataset.markers);
        markers.forEach((marker) => {
          new mapboxgl.Marker()
            .setLngLat([ marker.lng, marker.lat ])
            .addTo(map);
        });
        fitMapToMarkers(map, markers);
      }

  }
};


export { initMapbox };

