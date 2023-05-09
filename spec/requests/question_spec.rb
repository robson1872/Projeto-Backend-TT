require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  describe 'POST /formularies/:formulary_id/questions' do
    let!(:formulary) { Formulary.create(name: 'Formulary 1') }

    context 'com parâmetros válidos' do
      let(:question_params) do
        {
          name: 'Question 1',
          question_type: 'Multiple Choice'
        }
      end

      it 'cria uma nova pergunta' do
        expect {
          post "/formularies/#{formulary.id}/questions", params: { question: question_params }
        }.to change(Question, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context 'com parâmetros inválidos' do
      let!(:question) { Question.create(name: 'Question 2', formulary_id: formulary.id, question_type: 'Multiple Choice') }

      let(:invalid_question_params) do
        {
          name: 'Question 2',
          question_type: 'Text'
        }
      end

      it 'retorna erros de validação' do
        post "/formularies/#{formulary.id}/questions", params: { question: invalid_question_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
