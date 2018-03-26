class Message < ApplicationRecord
  scope :message_history, -> { all.last(10) }
  belongs_to :user

  before_create :upcase_text

  validates :text, presence: true

  private

  def upcase_text
    self.text.upcase!
  end
end
