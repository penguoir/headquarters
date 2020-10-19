class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # A user can't have two pins for the same project
  validates_uniqueness_of :user_id, :scope => [:project_id]

end
