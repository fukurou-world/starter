require 'swagger_helper'

RSpec.describe 'Skills API', type: :request do
  path '/api/v1/skills/register' do
    post 'Creates a skill' do
      tags 'Skills'
      consumes 'application/json'
      parameter name: :skill, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'skill created' do
        let(:skill) { { name: 'Ruby' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:skill) { { name: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/skills/index' do
    get 'Retrieves all skills' do
      tags 'Skills'
      produces 'application/json'

      response '200', 'skills found' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end

  path '/api/v1/skills/search' do
    post 'Searc a skill' do
      tags 'Skills'
      consumes 'application/json'
      parameter name: :skill, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'skill found' do
        let(:skill) { { name: 'Ruby' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:skill) { { name: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/skills/update/{id}' do
    put 'Updates a skill' do
      tags 'Skills'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :skill, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'skill updated' do
        let(:id) { Skill.create(name: 'Ruby') }
        let(:skill) { { name: 'Updated Name' } }
        run_test!
      end

      response '404', 'skill not found' do
        let(:id) { 'invalid' }
        let(:skill) { { name: 'Updated Name' } }
        run_test!
      end
    end
  end

  path '/api/v1/skills/delete/{id}' do
    delete 'Deletes a skill' do
      tags 'Skills'
      parameter name: :id, in: :path, type: :string

      response '204', 'skill deleted' do
        let(:id) { Skill.create(name: 'Ruby') }
        run_test!
      end

      response '404', 'skill not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
