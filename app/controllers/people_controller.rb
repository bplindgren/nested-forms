class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    3.times { @person.addresses.build }
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render "new"
    end
  end

  def show
    @person = People.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:name, addresses_attributes: [:kind, :street_address, :city, :state, :zip])
  end
end
