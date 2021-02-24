require  'rails_helper'
RSpec.describe WelcomesController, type:  :controller  do
  # группа тестов, которая отвечает за тестирование экшена  index
  describe "GET #index" do
    # тест проверяет что возвращается корретный запрос
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
