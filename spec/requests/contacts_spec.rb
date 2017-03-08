require 'rails_helper'

RSpec.describe "CreateCustomFields", type: :request do
  describe "GET /create_custom_fields" do
    let(:contact) { build :contact }
    let(:custom_field_textfield) { build :custom_field_textfield }
    let(:custom_field_combobox) { build :custom_field_combobox }

    before :each do
      @user = create(:user)
      login_as @user
    end

    it "creates contact" do
      visit new_contact_path
      fill_in 'contact_name', with: contact.name
      fill_in 'contact_email', with: contact.email
      submit_form

      expect(page).to have_content contact.name
      expect(page).to have_content contact.email
    end

    it "can't create contact with same name" do
      contact.save
      visit new_contact_path
      fill_in 'contact_name', with: contact.name
      fill_in 'contact_email', with: contact.email
      submit_form

      expect(page).to have_content 'Email has already been taken'
    end

    it "has textfield appearing" do
      custom_field_textfield.save
      visit new_contact_path
      expect(page).to have_css("label[for='contact_#{custom_field_textfield.name}']", text: custom_field_textfield.name.humanize)
      expect(page).to have_field("cf_#{custom_field_textfield.id}", with: custom_field_textfield.default)
    end

    it "rollback for custom_fields" do
      custom_field_textfield.save
      visit new_contact_path
      fill_in "cf_#{custom_field_textfield.id}", with: "testando"
      submit_form
      expect(page).to have_content "Email can't be blank"


      expect(page).to have_field("cf_#{custom_field_textfield.id}", with: "testando")
    end

    it "has combobox with default values" do
      custom_field_combobox.save
      visit new_contact_path
      expect(page).to have_select("cf_#{custom_field_combobox.id}", options: custom_field_combobox.default.split(/\r\n/))
    end

  end
end
