require 'rails_helper'

RSpec.describe "CreateCustomFields", type: :request do
  describe "GET /create_custom_fields" do
    let(:user_one) { create :user }
    let(:user_two) { create :other_user }
    let(:contact) { build :contact }
    let(:contact_same_email_one) { build :contact_same_email_one }
    let(:contact_same_email_two) { build :contact_same_email_two }
    let(:contact_same_email_three) { build :contact_same_email_three }
    let(:custom_field_textfield) { build :custom_field_textfield }
    let(:custom_field_textfield_one) { build :custom_field_textfield_one }
    let(:custom_field_textfield_two) { build :custom_field_textfield_two }
    let(:custom_field_textfield_three) { build :custom_field_textfield_three }

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

    it "has contacts with same email with diferent user scopes" do
      expect(contact_same_email_one.save).to be
      expect(contact_same_email_two.save).to be
      expect(contact_same_email_three.save).to_not be
    end

    it "has custom_fields with same email with diferent user scopes" do
      expect(custom_field_textfield_one.save).to be
      expect(custom_field_textfield_two.save).to be
      expect(custom_field_textfield_three.save).to_not be
    end

  end
end
