require 'rails_helper'

describe Decorator do
  it "can populate a sample user with default data" do
    user = User.new email: 'example@example.com'
    data = Decorator.new(user).populate

    expect(data[:company_name]).to eq 'unaffiliated'
  end

  it "does not overwrite existing data" do
    user = User.new email: 'example@example.com', company_name: 'sample'
    data = Decorator.new(user).populate

    expect(data[:company_name]).to eq 'sample'
  end

  it "can work with a regular hash as well" do
    data = Decorator.new({ email: 'missing@example.com' }).populate

    expect(data[:email]).to eq 'missing@example.com'
    expect(data[:company_name]).to eq 'unaffiliated'
  end
end
