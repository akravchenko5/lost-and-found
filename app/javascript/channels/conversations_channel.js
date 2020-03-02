import consumer from "./consumer"

const subscribeChannel = (conversationId) => {
  consumer.subscriptions.create({
    channel: 'ConversationChannel',
    conversation_id: conversationId
  }, {
    received(data) {
      console.log(data);
    }
  });
}

export default subscribeChannel;
