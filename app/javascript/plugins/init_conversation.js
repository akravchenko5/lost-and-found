import consumer from "../channels/consumer";
import { scrollDown } from '../components/init_messages';

const messageReceived = (userId, data) => {
  const messages = document.querySelector('.message-window');

  // Inside a conversation page
  if (messages && data.conversation === parseInt(messages.dataset.id)) {
    messages.insertAdjacentHTML('beforeend', data.message);

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
  const fileButton = document.querySelector('.image-upload');
  const fileInput = document.getElementById('message_photo');

  consumer.subscriptions.create({
    channel: 'UserChannel',
    user_id: window.userId
  }, {
    received(data) { messageReceived(window.userId, data) }
  });

  submitButton.addEventListener('click', (event) => {
    console.log('Does this work?');
    inputField.innerText = '';
    fileButton.classList.remove('selected');
    fileInput.Filelist = [];
  })
}

export { subscribeUser };
