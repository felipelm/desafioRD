class AddUserToCustomField < ActiveRecord::Migration
  def change
    add_reference :custom_fields, :user, index: true, foreign_key: true
  end
end
