class Milestone < ApplicationRecord
  include PublicActivity::Model
  tracked({
    :owner => -> (controller, model) { controller.current_user },
    :recipient => :project
  })

  has_rich_text :description

  belongs_to :project

  validates_presence_of :date
  validates_presence_of :title
end
