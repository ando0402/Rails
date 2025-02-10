import consumer from "./consumer"
// クライアントサイド
// consumer.subscriptions.create("RoomChannel", {
window.App = consumer.subscriptions.create("RoomChannel", {
  // 接続
  connected() {
    // Called when the subscription is ready for use on the server
  },

  // 切断時
  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  // 受信
  received(data) {
    // Called when there's incoming data on the websocket for this channel
    alert(data["message"])
  },

  speak: function(message) {
    // return this.perform('speak');
    return this.perform("speak", {message: message})
  }
});
