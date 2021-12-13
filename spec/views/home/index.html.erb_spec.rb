require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "can be rendered correctly" do
    render
    expect(response.body).to match "blog"
  end
end
