RSpec.describe 'Formularies', type: :request do
  describe 'POST /formularies' do
    context 'com parâmetros válidos' do
      let(:formulary_params) do
        {
          name: 'Formulary 1'
        }
      end

      it 'cria um novo formulário' do
        expect {
          post '/formularies', params: { formulary: formulary_params }
        }.to change(Formulary, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'com parâmetros inválidos' do
      let!(:existing_formulary) { Formulary.create(name: 'Existing Formulary') }

      let(:invalid_formulary_params) do
        {
          name: 'Existing Formulary'
        }
      end

      it 'retorna erros de validação' do
        post '/formularies', params: { formulary: invalid_formulary_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
