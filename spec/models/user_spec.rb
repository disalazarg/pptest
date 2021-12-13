require 'rails_helper'

RSpec.describe User, type: :model do
  it "accepts a valid email" do
    user = User.new email: 'example@example.com'
    expect(user.valid?).to be_truthy
  end

  it "rejects an invalid email" do
    user = User.new email: 'example-at-example.com'
    expect(user.valid?).to be_falsey
  end

  it "rejects an empty email" do
    user = User.new
    expect(user.valid?).to be_falsey
  end
end
