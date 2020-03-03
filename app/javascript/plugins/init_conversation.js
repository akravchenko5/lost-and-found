import consumer from "../channels/consumer";
import { scrolledDown } from '../components/init_messages';

const messageReceived = (userId, data) => {
  const messages = document.querySelector('.message-window');

  // Inside a conversation page
  if (messages && data.conversation === parseInt(messages.dataset.id)) {
    messages.insertAdjacentHTML('beforeend', data.message);

    scrolledDown();
  } else {
    const newMessageWrapper = document.getElementById('new_message_wrapper');

    newMessageWrapper.innerHTML = data.notification;

    const notificationContainer = document.querySelector('.message-notification-wrap');

    notificationContainer.classList.add('animation');
    setTimeout(() => { notificationContainer.classList.remove('animation'); }, 7000);
  }
}

const subscribeUser = () => {
  const userChannel = consumer.subscriptions.create({
    channel: 'UserChannel',
    user_id: window.userId
  }, {
    received(data) { messageReceived(window.userId, data) }
  });

  return userChannel;
}

export { subscribeUser };
