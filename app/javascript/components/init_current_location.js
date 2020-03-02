
// const latitude = document.getElementById('latitude');
// const longitude = document.getElementById('longitude');


const options = {
  enableHighAccuracy: true,
  timeout: 5000,
  maximumAge: 3
};

const setCookie = (name, value, exdays = 30) => {
  const d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();

  document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

const fetchCurrentPosition = (event, options) => {
  navigator.geolocation.getCurrentPosition((data) => {
    // console.log(data.coords.latitude + " " + data.coords.longitude);
    setCookie('cached_location', `${data.coords.latitude}, ${data.coords.longitude}`)
  });
};

export { fetchCurrentPosition }
