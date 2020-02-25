
const createItem = () => {
  const button = document.querySelector('.menu-button');
  const buttonBack = document.querySelector('.menu-button-back');
  const backgroundDark = document.querySelector('.menu-background-dark');
  const backgroundGreen = document.querySelector('.menu-background-green');

  if (button) {
    button.addEventListener('click', (event) => {
    event.preventDefault();
    if (backgroundDark) {
      backgroundDark.classList.add('show-menu');
    }
    if (backgroundGreen) {
      backgroundGreen.classList.add('show-menu');
    }
  });
  }

  if (buttonBack) {
    buttonBack.addEventListener('click', (event) => {
    event.preventDefault();
    if (backgroundDark) {
      backgroundDark.classList.remove('show-menu');
    }

    if (backgroundGreen) {
      backgroundGreen.classList.remove('show-menu');
    }
  });
  }



};

export { createItem }
