class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.integer :custom_field_type
      t.string :name
      t.text :description
      t.text :default

      t.timestamps null: false
    end
  end
end
