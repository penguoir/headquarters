class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :resources
  has_many :pins

  def display_name
    self.email.split('@', 2).first.capitalize
  end
end
