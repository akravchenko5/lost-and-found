const searchFormToggle = () => {
  const form = document.getElementById('search-page-form');
  const lostFound = document.getElementById('query_state');

  if (form) {
    lostFound.addEventListener('change', (event) => {
      form.classList.toggle('black-form');
    })
  }
}

export { searchFormToggle };
