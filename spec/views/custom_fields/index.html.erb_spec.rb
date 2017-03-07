require 'rails_helper'

RSpec.describe "custom_fields/index", type: :view do
  before(:each) do
    assign(:custom_fields, [
      create(:custom_field_textfield),
      create(:custom_field_combobox)
    ])
    @user = create(:user)
    login_as @user
  end

  it "renders a list of custom_fields" do
    render
  end
end
