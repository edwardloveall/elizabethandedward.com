class ChoiceController < ApplicationController
  skip_before_filter :require_login

  def update
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
    @person.choice.update(choice_params)
  end

  def find_person
    Person.find(params[:person_id])
  end

  def choice_params
    params.require(:choice).permit(:meal, :attending, :friday)
  end
end
