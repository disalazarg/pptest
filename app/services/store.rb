require "./app/services/decorator"

class Store
  def initialize(redis)
    @redis = redis
  end

  def store(user)
    data = Decorator.new(user).populate

    @redis.set "users:#{user[:email]}", data.to_json
  end

  def get(email)
    json = @redis.get("users:#{email}") || '{}'
    data = JSON.parse json, symbolize_names: true

    Decorator.new(data).populate
  end
end
