require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do
  path '/api/v1/askings/{client_id}' do
    parameter name: :client_id, in: :path, type: :integer, description: 'Client ID'
    get 'Retrieves all askings of a client' do
      tags 'Askings'
      produces 'application/json'

      describe '正常終了テスト' do
        let(:client) { create(:client) }
        let(:client_id) { client.id }
        response '200', 'OK' do
          schema type: :array, items: {
            type: :object, properties: {
              id: { type: :number, example: 1 },
              client_id: { type: :number, example: 332 },
              history: { type: :json, example: "{ sample_key: 'sample_value'}" },
              sent_at: { type: :datetime, example: '2028-06-13T06:10:33.000Z' }
            }
          }
          before do
            create_list(:asking, 5, client_id: client_id)
          end

          run_test! do |response|
            data = JSON.parse(response.body)
            data.each do |area|
              expect(area.keys).to contain_exactly('id', 'client_id', 'history', 'sent_at')
              expect(area['id']).to be_present
              expect(area['client_id']).to eq client.id
              expect(area['history']).to be_present
              expect(area['sent_at']).to be_present
            end
          end
        end
      end
    end
  end

  path '/api/v1/askings/send_mail' do
    post 'Send a asking' do
      tags 'Askings'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          dealer_id: { type: :integer, example: 19 },
          client_id: { type: :integer, example: 20 },
          contents: { type: :json, example: "{ title: 'sample_title', body: 'sample_body' }" }
        }, 
        required: ['dealer_id', 'client_id', 'contents']
      }

      describe '正常終了テスト' do
        response '200', 'ok' do
          let(:dealer_id) { create(:dealer).id }
          let(:client_id) { create(:client).id }
          let(:contents) { { title: 'test_title', body: 'test_body' } }
          let(:params) { { dealer_id: dealer_id, client_id: client_id, contents: contents } }
          run_test!
        end
      end

      describe '異常終了テスト' do
        response '404', 'Not Found' do
          let(:dealer_id) { 0 }
          let(:client_id) { 0 }
          let(:contents) { nil }
          let(:params) { { dealer_id: dealer_id, client_id: client_id, contents: contents } }
          run_test!
        end
      end
    end
  end
end
