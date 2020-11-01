class Project < ApplicationRecord
  include PublicActivity::Model
  tracked :owner => -> (controller, model) { controller.current_user }

  has_rich_text :brief
  has_many :resources, dependent: :destroy
  has_many :pins, dependent: :destroy
  has_many :chats, dependent: :destroy

  accepts_nested_attributes_for :pins

  def self.pinned_by(user)
    joins(:pins).where(pins: { user: user, pinned: true })
  end

  # All students who have pinned this project
  def students
    User.includes(:pins).where(pins: { project: self, pinned: true })
  end

  def pinned_by?(user)
    pins.where(user: user, pinned: true).any?
  end

  def last_activity
    PublicActivity::Activity.where(recipient: self)
      .or(PublicActivity::Activity.where(trackable: self))
      .order(created_at: :desc)
      .first
  end

  def important_activities
    PublicActivity::Activity.where( recipient: self)
      .or(PublicActivity::Activity.where( trackable: self))
      .order(created_at: :desc)
      .limit(15)
  end
end

