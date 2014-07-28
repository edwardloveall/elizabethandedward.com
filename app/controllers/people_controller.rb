class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:success] = "#{@person.name} created"
      redirect_to people_path
    else
      flash[:alert] = 'There was an error'
      render :new
    end
  end

  def edit
    @person = find_person
  end

  def update
    @person = find_person

    if @person.update(person_params)
      flash[:success] = "#{@person.name} updated"
      redirect_to people_path
    else
      flash[:alert] = 'There was an error'
      render :edit
    end
  end

  def destroy
    @person = find_person

    if @person.destroy
      flash[:success] = "Deleted #{@person.name}"
      redirect_to people_path
    else
      flash[:alert] = "There was an error deleting #{@person.name}"
      render :edit
    end
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end

  def find_person
    Person.find(params[:id])
  end
end
