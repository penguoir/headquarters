class Project < ApplicationRecord
  has_many :resources, dependent: :destroy
  has_many :pins, dependent: :destroy

  accepts_nested_attributes_for :pins

  def self.pinned_by(user)
    joins(:pins).where(pins: { user: user, pinned: true })
  end
end
