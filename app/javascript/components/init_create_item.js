
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

const foundNew = () => {
  const page =document.querySelector('.new-item-page-background');
  const buttonBack = document.querySelector('.menu-button-back');
  const backgroundGreen = document.querySelector('.new-found-background-green');
  const backgroundWhite = document.querySelector('.new-found-background-white');
  const backgroundDark = document.querySelector('.new-lost-background-dark');

  if (page) {
    window.addEventListener('load', (event) => {
      if (backgroundGreen) {
        backgroundGreen.classList.add('show-new-item');
        console.log('test 1');
      }
      if (backgroundWhite) {
        backgroundWhite.classList.add('show-new-item');
        console.log('test 2');
      }
      if (backgroundDark) {
        backgroundDark.classList.add('show-new-item');
        console.log('test 2');
      }
    });
  }
};

export { createItem, foundNew }
