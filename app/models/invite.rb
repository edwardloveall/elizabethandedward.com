class Invite < ActiveRecord::Base
  has_many :people

  accepts_nested_attributes_for :people

  def generate_token!
    loop do
      token = SecureRandom.hex(20)
      update(token: token)
      if Invite.find_by(token: token).present?
        break
      end
    end
  end
end
