
const latitude = document.getElementById('latitude');
const longitude = document.getElementById('longitude');

const fetchCurrentPosition = (event) => {
  // event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    latitude.value = data.coords.latitude
    longitude.value = data.coords.longitude
    // description.innerText =
    console.log(data.coords.latitude + " " + data.coords.longitude);
  });
};

export { fetchCurrentPosition }
