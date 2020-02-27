const toggleSettings = () => {
  const arrow = document.querySelector('.settings-arrow');
  const list = document.querySelector('.settings-item-content');
  const arrowFound = document.querySelector('.settings-arrow-found');
  const listFound = document.querySelector('.settings-item-content-found');

  if (arrow) {
    arrow.addEventListener('click', (event) => {
      if (list) {
        list.classList.toggle('show-settings-item-content');
      }
      if (arrow) {
        arrow.classList.toggle('show-button-rotate');
      }
    });
  }

  if (arrowFound) {
    arrowFound.addEventListener('click', (event) => {
      if (listFound) {
        listFound.classList.toggle('show-settings-item-content');
      }
      if (arrowFound) {
        arrowFound.classList.toggle('show-button-rotate');
      }
    });
  }

};


export { toggleSettings }
