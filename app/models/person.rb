class Person < ActiveRecord::Base
  belongs_to :invite
  has_one :choice

  def meal_choice
    self.choice.meal
  end

  def attending?
    self.choice.attending?
  end

  def to_partial_path
    if attending?
      'people/choices'
    else
      'people/absent'
    end
  end

  def name
    self.attributes['name'] || 'Guest'
  end
end
