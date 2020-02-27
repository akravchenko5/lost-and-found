const toggleForm = () => {
  const button = document.querySelector('.log-in-button');
  const form = document.querySelector('.sign-in-form-wrapper');

  if (button) {
    button.addEventListener('click', (event) => {
      if (form) {
        form.classList.toggle('show-sign-in-form');
      }
    });
  }
};


export { toggleForm }
