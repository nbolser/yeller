require 'rails_helper'
require 'clearance/rspec'

RSpec.describe MessagesController, type: :controller do
  describe 'GET /messages' do
    before do
      sign_in
      get :index
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'is HTML' do
      expect(response.content_type).to eq('text/html')
    end
  end

  describe 'POST /messages' do
    let(:messages_post_params) { { message: { text: 'Hello World!'}} }

    before do
      sign_in
      post :create, xhr: true, params: messages_post_params
    end

    it 'returns a 201' do
      expect(response).to have_http_status(:created)
    end

    it 'creates a Message record' do
      expect(Message.count).to eq(1)
    end

    context 'without search params' do
      let(:messages_post_params) { { message: { text: ''}} }

      it 'returns a 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'is text/html' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'does not create a Message record' do
        expect(Message.count).to eq(0)
      end
    end
  end
end