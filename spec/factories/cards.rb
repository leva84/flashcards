# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { 'FBI and CIA' }
    translated_text { 'CIA and FBI' }
    review_date { Time.new }
  end
end
