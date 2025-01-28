class SubRecord < ApplicationRecord
  self.abstract_class = true
  establish_connection :sub

  connects_to database: { writing: :sub }
end
