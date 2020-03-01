const fetchCurrentPosition = (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    console.log(date.coords.latitude + " " + date.coords.longitude);
    $.ajax({
        url : "/items/search",
        type : "post",
        data : { data_value: JSON.stringify(date.coords.latitude) }
    });
  });
};

export { fetchCurrentPosition }
