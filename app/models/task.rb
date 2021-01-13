class Task < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user, recipient: :project

  belongs_to :project
  belongs_to :user

  enum status: { incomplete: 0, complete: 1 }
end
