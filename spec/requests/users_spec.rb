require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /users' do
    context 'com parâmetros válidos' do
      let(:user_params) do
        {
          name: 'Joao',
          password: 'password123',
          email: 'joao@example.com',
          cpf: '473.399.810-47'
        }
      end

      it 'cria um novo usuário' do
        expect {
          post '/users', params: { user: user_params }
        }.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'com parâmetros inválidos' do
      let(:invalid_user_params) do
        {
          name: '',
          password: 'password',
          email: 'joao@example.com',
          cpf: '123.456.789-10'
        }
      end

      it 'retorna erros de validação' do
        post '/users', params: { user: invalid_user_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
