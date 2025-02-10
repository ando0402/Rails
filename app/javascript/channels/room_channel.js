import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
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
  },

  speak: function() {
    return this.perform('speak');
  }
});
