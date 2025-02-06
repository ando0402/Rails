class AsyncLogJob < ApplicationJob
  # queue_as :default
  queue_as :async_log

  # 渡されたメッセージ内容によって追加するキュー決める
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  # ジョブの例外処理
  retry_on StandardError, wait: :exponentially_longer, attempts: 3
  # 複数の例外クラスを指定することも可能
  # retry_on ArgumentError, ZeroDivisionError,wait:5.seconds, attempts: 3

  # ジョブの例外処理
  # discard_on StandardError
  # ブロックを使う例
  discard_on StandardError do |job, error|
    SomeNotifier.push(error)
  end

  def perform(message: "hello") # message引数を追加
    # Do something later
    AsyncLog.create!(message: message) # DBに保存する
  end
end
