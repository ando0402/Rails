import consumer from "./consumer"
// クライアントサイド
consumer.subscriptions.create("RoomChannel", {
// window.App = consumer.subscriptions.create("RoomChannel", {
  // 接続
  connected() {
    // Called when the subscription is ready for use on the server
    document.
        querySelector('input[data-behavior="room_speaker"]').
        addEventListener(`keypress`, (e) => {
          if (e.key === "Enter") {
            this.speak(event.target.value);
            event.target.value = "";
            return event.preventDefault();
          }
    });
  },
  // 切断時
  disconnected() {
    // Called when the subscription has been terminated by the server
    const elements = document.querySelector(`messages`)
    elements.insertAdjacentHTML('beforeend', `data[message]`)
  },

  // 受信
  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // alert(data["message"]);
    const elements = document.querySelector(`#messages`)
    elements.insertAdjacentHTML('beforeend', data[`message`])
  },

  speak: function(message) {
    // return this.perform('speak');
  return this.perform('speak', [message, message]);
  }
});
