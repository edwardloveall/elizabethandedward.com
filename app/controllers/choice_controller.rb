class ChoiceController < ApplicationController
  def update
    person = Person.find(params[:person_id])
    @choice = person.choice

    if @choice.update(choice_params)
      render json: choice_params
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:meal)
  end
end
