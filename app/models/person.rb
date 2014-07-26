class Person < ActiveRecord::Base
  belongs_to :invite
  has_one :choice
end
