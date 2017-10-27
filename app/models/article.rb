class Article < ApplicationRecord
  include AASM

  aasm do
    state :draft, :initial => true
    state :published

    #event :publish, before: ->{ self.published_at = Time.now } do
    event :publish do
      transitions :from => :draft, :to => :published

    end

    event :draft do
      transitions :from => :published, :to => :draft
    end

  end

  has_many :comments
  belongs_to :user
end
