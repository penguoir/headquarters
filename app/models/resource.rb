class Resource < ApplicationRecord
  include PublicActivity::Model
  tracked owner: :user, recipient: :project

  has_rich_text :content
  belongs_to :user
  belongs_to :project
end
