
class Address < ActiveRecord::Base
  belongs_to :person

  validates :kind, :street_address, :city, :state, :zip, presence: true
end
