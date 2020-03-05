import consumer from "../channels/consumer";
import { scrollDown } from '../components/init_messages';

const messageReceived = (userId, data) => {
  const inputField = document.querySelector('#message_content');
  const messages = document.querySelector('.message-window');
  const fileInput = document.getElementById('message_photo');
  const fileButton = document.querySelector('.image-upload');
  const loader = document.querySelector('.loader');
  const hiddenForm = document.querySelector('.form-group.string.optional.message_content');
  const submitButton = document.querySelector('#message-new-button');
  const hiddenForm2 = document.querySelector('.form-group.string.required.message_content');

  // Inside a conversation page
  if (messages && data.conversation === parseInt(messages.dataset.id)) {
    messages.insertAdjacentHTML('beforeend', data.message);

    inputField.value = '';
    fileInput.value = '';
    fileButton.classList.remove('selected');
    if (hiddenForm) {
      hiddenForm.classList.remove('d-none');
    }
    if (hiddenForm2) {
      hiddenForm.classList.remove('d-none');
    }
    fileInput.classList.add('d-none');
    loader.classList.add('d-none');
    inputField.classList.remove('d-none');
    submitButton.classList.remove('button-show');
    inputField.focus();

    scrollDown(true);
  } else {
    const newMessageWrapper = document.getElementById('new_message_wrapper');

    newMessageWrapper.innerHTML = data.notification;

    const notificationContainer = document.querySelector('.message-notification-wrap');

    notificationContainer.classList.add('animation');
    setTimeout(() => { notificationContainer.classList.remove('animation'); }, 7000);
  }
}

const subscribeUser = () => {
  const inputField = document.querySelector('#message_content');
  const submitButton = document.querySelector('#message-new-button');
  const loader = document.querySelector('.loader');
  const hiddenForm = document.querySelector('.form-group.string.optional.message_content');
  const hiddenForm2 = document.querySelector('.form-group.string.required.message_content');
  const fileInput = document.getElementById('message_photo');

  consumer.subscriptions.create({
    channel: 'UserChannel',
    user_id: window.userId
  }, {
    received(data) { messageReceived(window.userId, data) }
  });

  if (inputField) {
    inputField.addEventListener('keyup', (event) => {

      if (inputField.value.length >= 1 ) {
        submitButton.classList.add('button-show');

        if(event.keyCode === 13) {
          event.preventDefault();
        }

      } else {
        submitButton.classList.remove('button-show');
      }

    });
  }

  if (fileInput) {
    fileInput.addEventListener('change', () => {

      if (fileInput.files.length > 0) {
        submitButton.classList.add('button-show');

      } else {
        submitButton.classList.remove('button-show');
      }

    });
  }

  if (submitButton) {
    submitButton.addEventListener('click', (event) => {

      if (loader) {
        loader.classList.remove('d-none');
      }
      if (inputField) {
        inputField.classList.add('d-none');
      }

      if (hiddenForm) {
        hiddenForm.classList.add('d-none');
      }

      if (hiddenForm2) {
        hiddenForm2.classList.add('d-none');
      }

    });
  }
}

export { subscribeUser };
