require "./app/services/store"

redis = Redis.new
store = Store.new redis

IntercomRails.config do |config|
  config.user.custom_data = Proc.new { |user| store.get user.email }
end
