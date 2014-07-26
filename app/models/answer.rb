class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :person
end
