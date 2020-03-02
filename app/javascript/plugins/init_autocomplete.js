import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query_address');
  const latitude = document.getElementById('latitude');
  const longitude = document.getElementById('longitude');

  if (addressInput) {
    const autocomplete = places({ container: addressInput });

    autocomplete.on('change', data => {
      const { lat, lng } = data.suggestion.latlng;
      latitude.value = lat;
      longitude.value = lng;
    });
  }
};

const addressAutocompleteFoundLost = () => {
  const addressInput = document.getElementById('item_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete, addressAutocompleteFoundLost };
