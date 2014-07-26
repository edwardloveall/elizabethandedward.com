class Choice < ActiveRecord::Base
  belongs_to :person

  enum meal: { steak: 0, lobster: 1, 'chicken_fingers_(kids)' => 2 }
end
