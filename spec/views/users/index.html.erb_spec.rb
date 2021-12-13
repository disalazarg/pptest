require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "example@example.com"
      ),
      User.create!(
        email: "another@example.com"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "example@example.com".to_s, count: 1
  end
end
