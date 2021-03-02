# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show; end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)

    @card.save ? redirect_to(@card) : render(:new)
  end

  def edit; end

  def update
    @card.update(card_params) ? redirect_to(@card) : render(:edit)
  end

  def destroy
    @card.destroy

    redirect_to cards_path
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
