const toggleSettings = () => {
  const arrow = document.querySelector('.settings-arrow');
  const list = document.querySelector('.settings-item-content');
  const arrowFound = document.querySelector('.settings-arrow-found');
  const listFound = document.querySelector('.settings-item-content-found');
  const userArrow = document.querySelector('.user-arrow');
  const ratingList = document.querySelector('.user-item-content');

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

  if (userArrow) {
    userArrow.addEventListener('click', (event) => {
      if (ratingList) {
        console.log('click');
        ratingList.classList.toggle('show-user-item-content');
      }
      if (userArrow) {
        userArrow.classList.toggle('user-arrow-rotate');
      }
    });
  }

};


export { toggleSettings }
