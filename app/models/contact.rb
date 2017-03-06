class Contact < ActiveRecord::Base
  has_many :custom_field_values
  validates_uniqueness_of :name
end
