require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      email: "example@example.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/example.com/)
  end
end
