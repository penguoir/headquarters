class Resource < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user, recipient: :project

  belongs_to :user
  belongs_to :project
end
