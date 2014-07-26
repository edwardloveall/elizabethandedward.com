class ChoiceDecorator < Draper::Decorator
  def selected_meal_classes(meal)
    classes = ['choice']

    if meal == object.meal
      classes << 'selected'
    end

    return classes
  end
end
