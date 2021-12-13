class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: /@/
end
