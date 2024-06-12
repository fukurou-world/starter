require 'swagger_helper'

RSpec.describe 'api/v1/skills', type: :request do

  path '/api/v1/skills/index' do
    get 'get skill list' do
      consumes 'application/json'
      produces 'application/json'
      response 200, 'skill list' do
        schema type: :array, items: {
          type: :object,
          properties: {
            name: { type: :string },
          },
          required: [:name]
        }
        run_test!
      end
    end
  end
end
