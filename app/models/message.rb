class Message < ApplicationRecord
  scope :message_history, -> { all.last(10) }
  belongs_to :user

  validates :text, presence: true
end
