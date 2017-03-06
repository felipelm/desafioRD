class CreateCustomFieldValues < ActiveRecord::Migration
  def change
    create_table :custom_field_values do |t|
      t.references :contact, index: true, foreign_key: true
      t.references :custom_field, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
