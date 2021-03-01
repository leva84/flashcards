# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  text = (0..5001).to_a.map(&:to_s).join

  fixtures :cards
  it 'fixture method defined one' do
    cards(:one)
  end

  it 'has one after adding one' do
    expect(Card.count).to eq 1
  end

  it 'create without original_text Card' do
    card = Card.new(original_text: nil)
    expect(card.save).to eq false
  end

  it 'check original_text < 5 characters' do
    card = Card.new(original_text: 'FBI')
    expect(card.save).to eq false
  end

  it 'check original_text > 5000 characters' do
    card = Card.new(original_text: text)
    expect(card.save).to eq false
  end

  it 'create without translated_text Card' do
    card = Card.new(original_text: 'FBI and CIA', translated_text: nil)
    expect(card.save).to eq true
  end

  it 'check translated_text < 5 characters' do
    card = Card.new(original_text: 'FBI and CIA', translated_text: 'CIA')
    expect(card.save).to eq false
  end

  it 'check translated_text > 5000 characters' do
    card = Card.new(original_text: 'FBI and CIA', translated_text: text)
    expect(card.save).to eq false
  end

  after(:all) { Card.destroy_all }
end
