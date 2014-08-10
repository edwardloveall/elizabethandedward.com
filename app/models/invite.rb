class Invite < ActiveRecord::Base
  has_many :people

  accepts_nested_attributes_for :people

  scope :with_people_and_choices, -> { includes([people: :choice]) }

  def generate_token!
    loop do
      token = SecureRandom.hex(20)
      update(token: token)
      if Invite.find_by(token: token).present?
        break
      end
    end
  end

  def guest_added?
    self.plus_one_at.try(:past?) || false
  end

  def add_plus_one
    person = self.people.create(plus_one: true)
    person.choice.update(attending: true)
    person
  end
end
