# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, presence: true, length: { in: 5..5000 }
  validates :translated_text, presence: true, length: { in: 5..5000 }

  validate :unique_texts

  before_validation :date_time

  private

  def unique_texts
    errors.add(:translated_text, I18n.t('errors.unique_texts')) if original_text.casecmp?(translated_text)
  end

  def date_time
    self.review_date = Time.new + 3.days
  end
end
