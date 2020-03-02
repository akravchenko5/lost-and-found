
const latitude = document.getElementById('latitude');
const longitude = document.getElementById('longitude');

const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 3
};

const fetchCurrentPosition = (event, options) => {
  if (latitude && longitude) {
  console.log('fetching location')
    navigator.geolocation.getCurrentPosition((data) => {
      latitude.value = data.coords.latitude
      longitude.value = data.coords.longitude
      console.log(data.coords.latitude + " " + data.coords.longitude);
    });
  }
};

export { fetchCurrentPosition }
