class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum status: { incomplete: 0, complete: 1 }
end
