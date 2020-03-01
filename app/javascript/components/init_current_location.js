const fetchCurrentPositionWeather = (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    console.log(date.coords.latitude + " " + date.coords.longitude);
  });
};

