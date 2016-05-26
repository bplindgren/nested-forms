class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
    1.times { @person.addresses.build }
  end

  def create
    p params
    @person = Person.new(person_params)
    if @person.save
      new_addresses = params["person"]["addresses_attributes"]
      p '+++++++++'
      p new_addresses
      p '+++++++++'
      @person.addresses = new_addresses.each do |address|
        p address.value
        Address.create(address)
      end

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
