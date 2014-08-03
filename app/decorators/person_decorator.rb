class PersonDecorator < Draper::Decorator
  delegate_all

  def status
    if object.attending?
      'attending'
    else
      'absent'
    end
  end

  def meal_choice
    if object.meal
      h.content_tag(:td, object.meal.titleize, class: object.meal)
    else
      h.content_tag(:td, 'Not Selected', class: 'meal')
    end
  end

  def friday_choice
    if object.friday
      h.content_tag(:td, 'Yes', class: 'friday')
    else
      h.content_tag(:td, 'No', class: 'friday')
    end
  end
end
