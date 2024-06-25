require 'swagger_helper'

RSpec.describe 'Dealers API', type: :request do
  path '/auth' do
    post 'Creates a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :dealer, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'someone@gmailx.com' },
          password: { type: :string, example: 'testpass' },
          password_confirmation: { type: :string, example: 'testpass' },
          confirm_success_url: { type: :string, example: 'https://www.google.co.jp/' },
        },
      }
      response '200', 'dealers' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end
  path '/auth/sign_in' do
    post 'Sign in as a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :dealer, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'someone@gmailx.com' },
          password: { type: :string, example: 'testpass' },
        }
      }
      response '200', 'dealers' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end
  path '/auth/sign_out' do
    delete 'Sign out as a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :dealer, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }
      response '200', 'dealers' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end
  path '/auth/sessions' do
    get 'Get sessions as a dealer' do
      tags 'Dealers'
    end
  end

  path '/api/v1/dealers/index' do
    get 'Retrieves all dealers' do
      tags 'Dealers'
      produces 'application/json'

      response '200', 'dealers found' do
        schema type: :array, items: {}
        run_test!
      end
    end
  end

  path '/api/v1/dealers/search' do
    post 'Searc a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :dealer, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }
    end
  end

  path '/api/v1/dealers/update/{id}' do
    put 'Updates a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :dealer, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }
    end
  end

  path '/api/v1/dealers/delete/{id}' do
    delete 'Deletes a dealer' do
      tags 'Dealers'
      parameter name: :id, in: :path, type: :string
    end
  end
end
