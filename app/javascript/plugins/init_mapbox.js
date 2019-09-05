import mapboxgl from 'mapbox-gl';

const initMapbox = () => {

  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
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
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);

  }
};


export { initMapbox };

