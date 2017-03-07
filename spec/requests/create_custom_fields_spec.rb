require 'rails_helper'

RSpec.describe "CreateCustomFields", type: :request do
  describe "GET /create_custom_fields" do
    let(:custom_field) { build :custom_field }

    it "have custom_field type options" do
      visit new_custom_field_path
      expect(page).to have_select('custom_field_custom_field_type', options: ['Text', 'Text Area', 'Combo Box'])
    end

    it "creates custom_field" do
      visit new_custom_field_path
      within '#custom_field_custom_field_type' do
        find("option[value='#{custom_field.custom_field_type}']").click
      end
      fill_in 'custom_field_name', with: custom_field.name
      submit_form

      expect(page).to have_content '0'
      expect(page).to have_content 'texto'
    end

    it "can't create custom_field with same name" do
      custom_field.save
      visit new_custom_field_path
      within '#custom_field_custom_field_type' do
        find("option[value='#{custom_field.custom_field_type}']").click
      end
      fill_in 'custom_field_name', with: custom_field.name
      submit_form

      expect(page).to have_content 'Name has already been taken'
    end

    it "destroys custom_field" do
      custom_field.save
      visit custom_fields_path
      expect(page).to have_content custom_field.name
      find('tr', text: custom_field.name).click_link("Destroy")
      expect(page).to have_no_content custom_field.name
    end

    it "edits custom_field" do
      custom_field.save
      visit custom_fields_path
      expect(page).to have_content custom_field.name
      find('tr', text: custom_field.name).click_link("Edit")
      expect(page).to have_select('custom_field_custom_field_type', selected: "Text")
      expect(page).to have_content custom_field.description
      expect(page).to have_content custom_field.default
    end

  end
end
