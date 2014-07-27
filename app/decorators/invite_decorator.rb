class InviteDecorator < Draper::Decorator
  delegate_all

  def plus_one
    if object.allow_plus_one? && !object.guest_added?
      { partial: 'plus_one', locals: { invite: object } }
    else
      'shared/blank'
    end
  end
end
