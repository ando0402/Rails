require "test_helper"

class AsyncLogJobTest < ActiveJob::TestCase
  # assert_enqueued_withアサーションを使ってキューにジョブが追加されるかどうかテストしています
  test "Enqueue AsyncLogJob" do
    assert_enqueued_with(job: AsyncLogJob) do
      AsyncLogJob.perform_later(message: "from test")
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
