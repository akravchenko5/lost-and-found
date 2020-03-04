
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
  const page = document.querySelector('.new-item-page-background');
  const buttonBack = document.querySelector('.menu-button-back');
  const backgroundGreen = document.querySelector('.new-found-background-green');
  const backgroundWhite = document.querySelector('.new-found-background-white');
  const backgroundDark = document.querySelector('.new-lost-background-dark');
  const reward = document.getElementById('item_reward');

  if (page) {
    window.addEventListener('load', (event) => {
      if (backgroundGreen) {
        backgroundGreen.classList.add('show-new-item');
      }
      if (backgroundWhite) {
        backgroundWhite.classList.add('show-new-item');
      }
      if (backgroundDark) {
        backgroundDark.classList.add('show-new-item');
      }
    });
  // reward.addEventListener('focus', (event) => {
  //   this.blur;
  // });
  if (reward) {
      reward.addEventListener('keydown', (event) => {
        if (event.key === 'ArrowUp' || event.key === 'ArrowDown') {
        event.preventDefault();
        };
      });
    };
  }
};

const displaySettings = () => {
  const button = document.querySelector('.menu-settings');
  const menu = document.querySelector('.settings-page-wrap');
  const body = document.body
  const back = document.querySelector('.settings-back')

  if (button) {
    button.addEventListener('click', (event) => {
      menu.classList.add('show-settings');
      body.classList.add('noscroll');
    });
  }
  if (back) {
    back.addEventListener('click', (event) => {
      console.log('what');
      menu.classList.remove('show-settings');
      body.classList.remove('noscroll');
    });
  }
};

export { createItem, foundNew, displaySettings }
