class Task < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user, recipient: :project

  belongs_to :project
  belongs_to :user

  has_rich_text :content

  enum status: { incomplete: 0, complete: 1 }
end
