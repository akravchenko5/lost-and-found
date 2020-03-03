import smoothscroll from 'smoothscroll-polyfill';

const scrollDown = (smooth = false) => {
  const objDiv = document.querySelector(".message-window");

  if (smooth) {
    objDiv.scroll({
      top: objDiv.scrollHeight,
      left: 0,
      behavior: 'smooth'
    });
  }
  else {
    objDiv.scrollTop = objDiv.scrollHeight;
  }
};

const chatLoadListener = () => {
  // kick off the polyfill!
  smoothscroll.polyfill();

  const objDiv = document.querySelector(".message-window");

  document.addEventListener('DOMContentLoaded', () => {
    if (objDiv) {
      objDiv.classList.remove('d-none');
      scrollDown();
    }
  });
}

const uploadButton = () => {
  const button = document.querySelector('.image-upload');
  const input = document.getElementById('message_photo');

  if (!button) {
    return;
  }

  input.addEventListener('change', () => {
    if (input.files.length > 0) {
      button.classList.add('selected');
    } else {
      button.classList.remove('selected');
    }
  });
};

export { scrollDown, uploadButton, chatLoadListener }
