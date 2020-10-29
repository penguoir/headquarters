class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:student, :teacher, :admin]

  has_many :resources
  has_many :pins

  def display_name
    self.email.split('@', 2).first.capitalize
  end

  def pinned_projects
    Project.pinned_by(self)
  end
end

