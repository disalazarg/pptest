require 'rails_helper'

describe Store do
  before do
    @user  = User.new email: 'example@example.com', company_name: 'example'

    @redis = Redis.new
    @store = Store.new @redis
  end
  
  it "can store data for an user" do
    result = @store.store @user

    expect(result).to eq "OK"
  end

  it "can retrieve prepopulated data for an user" do
    @store.store @user
    result = @store.get @user.email

    expect(result[:company_name]).to eq 'example'
  end

  it "can fill out missing data with defaults if it was missing in store" do
    @redis.set "users:incomplete@example.com", { email: 'incomplete@example.com' }.to_json
    result = @store.get 'incomplete@example.com'

    expect(result[:company_name]).to eq 'unaffiliated'
  end
end
