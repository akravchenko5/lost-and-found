import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query_address');

  if (addressInput) {
    const autocomplete = places({ container: addressInput });
    autocomplete.on('change', e => console.log(e.suggestion));
  }
};

export { initAutocomplete };
