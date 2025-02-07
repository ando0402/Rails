class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing (/[0-9]+-Comment@/i) => :comments
end
