# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'checking creation and validations' do
    let!(:card1) { create(:card) }
    text = (0..5001).to_a.map(&:to_s).join

    it 'has one after adding one' do
      expect(Card.count).to eq 1
      expect(card1.original_text == 'FBI and CIA')
    end

    it 'create without original_text Card' do
      expect(build(:card, original_text: nil).save).to eq false
    end

    it 'check original_text < 5 characters' do
      expect(build(:card, original_text: 'FBI').save).to eq false
    end

    it 'check original_text > 5000 characters' do
      expect(build(:card, original_text: text).save).to eq false
    end

    it 'create without translated_text Card' do
      expect(build(:card, original_text: 'FBI and CIA', translated_text: nil).save).to eq true
    end

    it 'check translated_text < 5 characters' do
      expect(build(:card, original_text: 'FBI and CIA', translated_text: 'CIA').save).to eq false
    end

    it 'check translated_text > 5000 characters' do
      expect(build(:card, original_text: 'FBI and CIA', translated_text: text).save).to eq false
    end

    after(:all) { Card.destroy_all }
  end
end
