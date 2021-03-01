# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcomes#index'

  resources :cards, only: :index
end
