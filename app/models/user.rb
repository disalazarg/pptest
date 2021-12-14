class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: /@/

  has_many :segments,  class_name: "User", foreign_key: :id
  has_many :campaigns, class_name: "User", foreign_key: :id
  has_many :designs,   class_name: "User", foreign_key: :id

  attr_accessor :first_name, :parsed_first_name, :company_name, :sign_up_source, :store_connected
end
