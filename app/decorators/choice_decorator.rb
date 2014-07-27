class ChoiceDecorator < Draper::Decorator
  def selected_meal_classes(meal)
    classes = ['choice', 'meal']

    if meal == object.meal
      classes << 'selected'
    end

    return classes
  end

  def selected_friday_classes
    classes = ['choice', 'friday']

    if object.friday?
      classes << 'selected'
    end

    return classes
  end
end
