require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = create(:contact)
    @user = create(:user)
    login_as @user
  end

  it "renders attributes in <p>" do
    render
  end
end
