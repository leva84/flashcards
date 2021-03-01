# frozen_string_literal: true

class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :original_text, length: { in: 5..5000 }
  validates :translated_text, length: { in: 5..5000 }, allow_blank: true
end
