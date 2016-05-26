class Person < ActiveRecord::Base
  has_many :addresses

  accepts_nested_attributes_for :addresses

  validates :name, presence: true
  validates_associated :addresses
end
