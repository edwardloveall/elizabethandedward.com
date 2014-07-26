class Person < ActiveRecord::Base
  belongs_to :invite
  has_one :choice

  def meal_choice
    self.choice.meal
  end
end
