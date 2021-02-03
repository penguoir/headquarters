class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates_presence_of :body

  scope :recent, -> {
    order(created_at: :desc).where.not(is_deleted: true)
  }
end
