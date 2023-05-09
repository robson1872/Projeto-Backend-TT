require 'rails_helper'
require 'jwt'
RSpec.describe 'Visits API', type: :request do
  SECRET = "yoursecretword"

  let(:user) { User.create(name: 'John', email: 'john@example.com', cpf: '134.674.024-02', password: 'password') }
  let(:valid_token) do
    payload = { user_id: user.id }
    secret_key = SECRET
    JWT.encode(payload, secret_key, 'HS256')
  end
  describe 'POST /visits' do
    context 'com parâmetros válidos' do
      let(:valid_visit_params) do
        {
          date: Date.current,
          status: 'PENDENTE',
          user_id: user.id,
          checkin_at: DateTime.now + 1.hour,
          checkout_at: DateTime.now + 2.hours
        }
      end

      it 'cria uma nova visita' do
        post '/visits',
          params: { visit: valid_visit_params },
          headers: { 'Authorization' => "Bearer #{valid_token}" }

        expect(response).to have_http_status(:created)
      end
    end

    context 'com parâmetros inválidos' do
      let(:invalid_visit_params) do
        {
          date: Date.current - 1.day,
          status: 'INVALIDO',
          user_id: 9999,
          checkin_at: DateTime.now + 1.hour,
          checkout_at: DateTime.now
        }
      end

      it 'retorna erros de validação' do
        post '/visits',
          params: { visit: invalid_visit_params },
          headers: { 'Authorization' => "Bearer #{valid_token}" }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /visits/:id' do
    let(:visit) { create(:visit, user: user) }

    it 'retorna uma visita específica' do
      get "/visits/#{visit.id}",
        headers: { 'Authorization' => "Bearer #{valid_token}" }

      expect(response).to have_http_status(:ok)
    end
  end
end
