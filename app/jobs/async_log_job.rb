class AsyncLogJob < ApplicationJob
  # queue_as :default
  queue_as :async_log
  def perform(message: "hello") # message引数を追加
    # Do something later
    AsyncLog.create!(message: message) # DBに保存する
  end
end
