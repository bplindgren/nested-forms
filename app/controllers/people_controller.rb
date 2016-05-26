class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    1.times { @person.addresses.build }
  end

  def create
    @person = Person.new(person_params)
    # @person.addresses.person_id = @person.id
    if @person.save
      # @person.address
      redirect_to people_path
    else
      render :new
    end
  end

  def show
    @person = People.find(params[:id])
  end

  private

  def person_params
    params.require(:person).permit(:name, address_addributes: [:kind, :street_address, :city, :state, :zip])
  end
end
