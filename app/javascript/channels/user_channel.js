import consumer from "./consumer"

const subscribeChannel = (userId) => {
  consumer.subscriptions.create({
    channel: 'UserChannel',
    user_id: userId
  }, {
    received(data) {
      console.log(data);
    }
  });
}

// const subscribeChannel = (conversationId) => {
//   consumer.subscriptions.create({
//     channel: 'ConversationChannel',
//     conversation_id: conversationId
//   }, {
//     received(data) {
//       console.log(data);
//     }
//   });
// }

export default subscribeChannel;
