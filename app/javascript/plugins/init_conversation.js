import consumer from "../channels/consumer";
import { scrolledDown } from '../components/init_messages';

const subscribeChannel = (conversationId) => {
  const conversationChannel = consumer.subscriptions.create({
    channel: 'ConversationChannel',
    conversation_id: conversationId
  }, {
    received(data) { messageReceived(conversationId, data) }
  });

  return conversationChannel;
}

const messageReceived = (conversationId, data) => {
  const messages = document.querySelector('.message-window');
  const userId = document.getElementById('new_message_current_user');

  // Inside a conversation page
  if (messages && conversationId === parseInt(messages.dataset.id)) {
    if (parseInt(userId.value) !== data.user) {
      data.message = data.message.replace('self-message">', '">');
    }

    messages.insertAdjacentHTML('beforeend', data.message);

    scrolledDown();
  } else {
    const newMessageWrapper = document.getElementById('new_message_wrapper');
    //const notificationMessage = document.querySelector('.notification-message');

    //notificationMessage.innerText = '';

    newMessageWrapper.innerHTML = data.notification;

    const notificationContainer = document.querySelector('.message-notification-wrap');

    notificationContainer.classList.add('animation');
    setTimeout(function(){ notificationContainer.classList.remove('animation'); }, 7000);
  }
}

const subscribeConversations = () => {
  const messages = document.querySelector('.message-window');

  window.conversationIds.forEach(conversation => {
    const channel = subscribeChannel(conversation);

    if (messages && conversation === parseInt(messages.dataset.id)) {
      const messageBox = document.getElementById('new_message_content');
      const messageForm = document.querySelector('.new_message');

      messageForm.addEventListener('submit', (event) => {
        event.preventDefault();

        channel.send({
          conversation_id: parseInt(messages.dataset.id),
          content: messageBox.value
        });

        messageBox.value = '';
      });
    }
  });
}

export { subscribeConversations };
