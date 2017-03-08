require 'rails_helper'

RSpec.describe "CreateCustomFields", type: :request do
  describe "GET /create_custom_fields" do
    let(:user_one) { create :user }
    let(:user_two) { create :other_user }
    let(:contact) { build :contact }
    let(:custom_field_textfield) { build :custom_field_textfield }

    it "has textfield that appears only to correct user" do
      custom_field_textfield.save
      login_as user_one

      visit new_contact_path
      expect(page).to have_css("label[for='contact_#{custom_field_textfield.name}']", text: custom_field_textfield.name.humanize)
      expect(page).to have_field("cf_#{custom_field_textfield.id}", with: custom_field_textfield.default)

      logout
      login_as user_two

      visit new_contact_path
      expect(page).to have_no_css("label[for='contact_#{custom_field_textfield.name}']", text: custom_field_textfield.name.humanize)
      expect(page).to have_no_field("cf_#{custom_field_textfield.id}", with: custom_field_textfield.default)
    end

    it "has contact that appears only to correct user" do
      contact.save
      login_as user_one

      visit contacts_path
      expect(page).to have_content contact.name

      logout
      login_as user_two

      visit contacts_path
      expect(page).to have_no_content contact.name
    end

  end
end
