RSpec.describe 'Answers', type: :request do
  describe 'POST /formularies/:formulary_id/questions/:question_id/answers' do
    let!(:formulary) { Formulary.create(name: 'Formulary 1') }
    let!(:question) { formulary.questions.create(name: 'Question 1') }

    context 'com parâmetros válidos' do
      let(:answer_params) do
        {
          content: 'Answer content',
          formulary_id: formulary.id,
          question_id: question.id,
          visit_id: 1,
          answered_at: Time.now
        }
      end

      it 'cria uma nova resposta' do
        allow(Question).to receive(:find).with(question.id).and_return(question)

        expect {
          post "/formularies/#{formulary.id}/questions/#{question.id}/answers", params: { answer: answer_params }
        }.to change(Answer, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

  end
end
