class Person < ActiveRecord::Base
  after_create :create_choice

  belongs_to :invite
  has_one :choice

  def create_choice
    Choice.create(person: self)
  end

  def meal_choice
    self.choice.meal
  end

  def attending?
    self.choice.try(:attending?) || false
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
