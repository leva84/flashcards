# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CardsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
