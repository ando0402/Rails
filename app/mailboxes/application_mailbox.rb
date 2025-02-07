class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  # commentsへ処理を移すrouting
  routing (/[0-9]+-Comment@/i) => :comments
  routing all: :backstop
end
