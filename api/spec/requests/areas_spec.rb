require 'swagger_helper'

RSpec.describe 'Areas API', type: :request do
  path '/api/v1/areas/register' do
    post 'Creates a area' do
      tags 'Areas'
      consumes 'application/json'
      parameter name: :area, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'area created' do
        let(:area) { { name: 'Ruby' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:area) { { name: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/areas/index' do
    get 'Retrieves all areas' do
      tags 'Areas'
      produces 'application/json'

      response '200', 'areas found' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end

  path '/api/v1/areas/update/{id}' do
    put 'Updates a area' do
      tags 'Areas'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :area, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'area updated' do
        let(:id) { Area.create(name: 'Ruby') }
        let(:area) { { name: 'Updated Name' } }
        run_test!
      end

      response '404', 'area not found' do
        let(:id) { 'invalid' }
        let(:area) { { name: 'Updated Name' } }
        run_test!
      end
    end
  end

  path '/api/v1/areas/delete/{id}' do
    delete 'Deletes a area' do
      tags 'Areas'
      parameter name: :id, in: :path, type: :string

      response '204', 'area deleted' do
        let(:id) { Area.create(name: 'Ruby') }
        run_test!
      end

      response '404', 'area not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
