const review = () => {
  const userArrow = document.querySelector('.user-arrow');
  const ratingList = document.querySelector('.user-item-content');
  const reviewButton = document.querySelector('.user-send-review');
  const reviewForm = document.querySelector('.user-new-review');

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

  if (reviewButton) {
    reviewButton.addEventListener('click', (event) => {
      if (reviewForm) {
        reviewForm.classList.toggle('show-review-form');
      }
    });
  }

};

export { review }
