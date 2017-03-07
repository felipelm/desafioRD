require 'rails_helper'

RSpec.describe "custom_fields/show", type: :view do
  before(:each) do
    @custom_field = assign(:custom_field, create(:custom_field_combobox))
    @user = create(:user)
    login_as @user
  end

  it "renders attributes in <p>" do
    render
  end
end
