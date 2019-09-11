import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElementDashboard = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    // mark o endereço de todos os jobs no dashboard
    if (Array.isArray(markers)) {
      markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    } // mark apenas o endereço do job no Work_order user e manager
      else {
      bounds.extend([markers.lng, markers.lat]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }

  };


  if (mapElementDashboard) {

    mapboxgl.accessToken = mapElementDashboard.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 15
    });

    const markers = JSON.parse(mapElementDashboard.dataset.markers);
    // mark o endereço de todos os jobs no dashboard
    if (Array.isArray(markers)) {
      markers.forEach((marker) => {

        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '55px';
        element.style.height = '55px';


        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      });
    } // mark apenas o endereço do job no Work_order user e manager
      else {
        const popup = new mapboxgl.Popup().setHTML(markers.infoWindow);

        new mapboxgl.Marker()
          .setLngLat([markers.lng, markers.lat])
          .setPopup(popup)
          .addTo(map);

    }
    fitMapToMarkers(map, markers);

  }
};



export { initMapbox };



