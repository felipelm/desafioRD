class Contact < ActiveRecord::Base
  has_many :custom_field_values, dependent: :destroy
  validates_uniqueness_of :email
end
