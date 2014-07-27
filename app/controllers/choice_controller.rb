class ChoiceController < ApplicationController
  def meal
    if update_choice
      render json: choice_params
    end
  end

  def attending
    if update_choice
      render @person
    end
  end

  private

  def update_choice
    @person = find_person
    choice = @person.choice
    choice.update(choice_params)
  end

  def find_person
    Person.find(params[:person_id])
  end

  def choice_params
    params.require(:choice).permit(:meal, :attending)
  end
end
