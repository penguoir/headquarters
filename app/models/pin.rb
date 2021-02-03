class Pin < ApplicationRecord
  include PublicActivity::Model
  tracked :owner => :user, :recipient => :project, :only => :create

  belongs_to :user
  belongs_to :project

  # A user can't have two pins for the same project
  validates_uniqueness_of :user, scope: :project
end
