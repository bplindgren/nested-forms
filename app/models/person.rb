
class Person < ActiveRecord::Base
  has_many :addresses

  accepts_nested_attributes_for :addresses,
        :reject_if => proc {|attributes|
          attributes.all? {|k,v| v.blank?}
        }

  validates :name, presence: true
  validates_associated :addresses
end
