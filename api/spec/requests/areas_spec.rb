require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do
  path '/api/v1/areas/create' do
    post 'Creates a area' do
      tags 'Areas'
      consumes 'application/json'
      parameter name: :area, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'area_test' }
        },
        required: ['name']
      }

      produces 'application/json'
      describe '正常終了テスト' do
        response '201', 'Created' do
          let(:area) { { name: 'area_test' } }
          schema type: :object, properties: {
            id: { type: :integer, example: 1 },
            name: { type: :string, example: 'area_test' },
            created_at: { type: :string, example: '2030-03-01 20:45:22' },
            updated_at: { type: :string, example: '2030-03-01 20:45:22' }
          }
          run_test!
        end
      end

      describe '異常終了テスト' do
        response '422', 'Invalid Request' do
          let(:area) { { name: '' } }
          schema type: :object,
          properties: {
            error: { type: :string, example: 'Invalid Request' }
          }
          run_test!
        end
      end
    end
  end

  path '/api/v1/areas/index' do
    get 'Retrieves all areas' do
      tags 'Areas'
      produces 'application/json'

      describe '正常終了テスト' do
        response '200', 'OK' do
          before do
            create_list(:area, 2) # Create 2 area records for the test
          end

          schema type: :array, items: {
            type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: 'area_test' },
              created_at: { type: :string, example: '2030-03-01 20:45:22' },
              updated_at: { type: :string, example: '2030-03-01 20:45:22' }
            }
          }
          run_test!
        end
      end

      describe '異常終了テスト' do
        response '404', 'Not Found' do
          before do
            Area.delete_all
          end
          schema type: :object,
          properties: {
            error: { type: :string, example: 'Not Found' }
          }
          run_test!
        end
      end
    end
  end

  path '/api/v1/areas/update' do
    put 'Updates a area' do
      tags 'Areas'
      consumes 'application/json'
      parameter name: :area, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer, example: 1 },
          name: { type: :string, example: 'Updated Name' }
        },
        required: ['id', 'name']
      }

      produces 'application/json'
      describe '正常終了テスト' do
        response '200', 'Updated' do
          let(:id) { create(:area).id }
          let(:area) { { id: id, name: 'Updated Name' } }
          schema type: :object,
            properties: {
              id: { type: :integer, example: 1 },
              name: { type: :string, example: 'Updated Name' }
            }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data['name']).to eq('Updated Name')
          end
        end
      end

      describe '異常終了テスト' do
        response '400', 'Bad Request' do
          let(:area) { { name: 'Updated Name' } }
          schema type: :object,
          properties: {
            error: { type: :string, example: 'Bad Request' }
          }
          run_test!
        end

        response '404', 'Not Found' do
          let(:id) { create(:area).id }
          let(:area) { { id: id + 1, name: 'Updated Name' } }
          schema type: :object,
          properties: {
            error: { type: :string, example: 'Not Found' }
          }
          run_test!
        end
      end
    end
  end

  path '/api/v1/areas/delete' do
    delete 'Deletes a area' do
      tags 'Areas'
      consumes 'application/json'
      parameter name: :area, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
        }, 
        required: ['id']
      }

      describe '正常終了テスト' do
        response '204', 'Deleted' do
          let(:id) { create(:area).id }
          let(:area) { { id: id } }
          run_test!
        end
      end

      describe '異常終了テスト' do
        response '404', 'Not Found' do
          let(:id) { create(:area).id }
          let(:area) { { id: id + 1 } }
          run_test!
        end
      end
    end
  end
end
