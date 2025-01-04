require 'swagger_helper'

RSpec.describe 'Dealers API', type: :request do
  # TODO: 認証実装時に作成
  # path '/auth' do
  #   post 'Creates a dealer' do
  #     tags 'Dealers'
  #     consumes 'application/json'
  #     parameter name: :dealer, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         email: { type: :string, example: 'someone@gmailx.com' },
  #         password: { type: :string, example: 'testpass' },
  #         password_confirmation: { type: :string, example: 'testpass' },
  #         confirm_success_url: { type: :string, example: 'https://www.google.co.jp/' },
  #       },
  #     }
  #     response '200', 'dealers' do
  #       schema type: :array, items: {}
  #       run_test!
  #     end
  #   end
  # end

  # path '/auth/sign_in' do
  #   post 'Sign in as a dealer' do
  #     tags 'Dealers'
  #     consumes 'application/json'
  #     parameter name: :dealer, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         email: { type: :string, example: 'someone@gmailx.com' },
  #         password: { type: :string, example: 'testpass' },
  #       }
  #     }
  #     response '200', 'dealers' do
  #       schema type: :array, items: {}
  #       run_test!
  #     end
  #   end
  # end
  # path '/auth/sign_out' do
  #   delete 'Sign out as a dealer' do
  #     tags 'Dealers'
  #     consumes 'application/json'
  #     parameter name: :dealer, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         name: { type: :string }
  #       },
  #       required: ['name']
  #     }
  #     response '200', 'dealers' do
  #       schema type: :array, items: {}
  #       run_test!
  #     end
  #   end
  # end
  # path '/auth/sessions' do
  #   get 'Get sessions as a dealer' do
  #     tags 'Dealers'
  #   end
  # end

  path '/api/v1/dealers/{id}' do
    get 'Fetch single dealer' do
      tags 'Dealers'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      describe '正常終了テスト' do
        # テスト用データを使用し削除
        before do
          @area = create(:area)
          @dealers = create_list(:dealer, 2)
          @dealers.each do |dealer|
            create(:dealer_area, dealer: dealer, area: @area)
          end
        end
        
        let(:id) { @dealers.first.id }
        response '200', 'dealer found' do
          schema type: :object, properties: {
            id: { type: :number, example: 1 },
            avatar: { type: :string, example: "/img/sample" },
            name: { type: :string, example: "ディーラー太郎" },
            gender: { type: :string, example: "male" },
            email: { type: :string, example:   "mail@dummy.co.xx" },
            encrypted_password: { type: :string, example: "password" },
            tel: { type: :string, example:   "01022004400" },
            dealer_name: { type: :string, example:   "D-TRO" },
            url_x: { type: :string, example: "dtaroxx1111" },
            date_of_becoming: { type: :date, example: "2022-10-02" },
            fee_min: { type: :number, example: 1400 },
            fee_max: { type: :number, example: 3000 },
            payment_account: { type: :string, example: "UFJ" },
            notices: { type: :string, example: "特記事項" },
            deleted_at: { type: :datetime, example: "2025-02-03" },
            areas: { type: :array, items: {
              type: :object,
              properties: {
                id: { type: :number, example: 1 },
                name: { type: :string, example: "area_test" }
              }
            }}
          }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data.keys).to contain_exactly('id', 'avatar', 'name', 'gender', 'email', 'encrypted_password', 'tel', 'dealer_name', 'url_x', 'date_of_becoming', 'fee_min', 'fee_max', 'payment_account', 'notices', 'deleted_at', 'areas')
            expect(data['id']).to be_present
          end
        end
      end
      describe '異常終了テスト' do
        let(:id) { 999 }
        response '404', 'Not Found' do
          schema type: :object, properties: {
            error: { type: :string, example: 'Not Found' }
          }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data['error']).to be_present
          end
        end
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

  path '/api/v1/dealers/delete' do
    post 'Deletes a dealer' do
      tags 'Dealers'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer }
        },
        required: ['id']
      }
      before do
        @dealer = create(:dealer)
      end

      produces 'application/json'
      describe '正常終了テスト' do
        let(:params) { { id: @dealer.id } }
        response '200', 'ok' do
          schema type: :object, properties: {
            id: { type: :number, example: 1 },
            avatar: { type: :string, example: "/img/sample" },
            name: { type: :string, example: "ディーラー太郎" },
            gender: { type: :string, example: "male" },
            email: { type: :string, example:   "mail@dummy.co.xx" },
            encrypted_password: { type: :string, example: "password" },
            tel: { type: :string, example:   "01022004400" },
            dealer_name: { type: :string, example:   "D-TRO" },
            url_x: { type: :string, example: "dtaroxx1111" },
            date_of_becoming: { type: :date, example: "2022-10-02" },
            fee_min: { type: :number, example: 1400 },
            fee_max: { type: :number, example: 3000 },
            payment_account: { type: :string, example: "UFJ" },
            notices: { type: :string, example: "特記事項" },
            deleted_at: { type: :datetime, example: "2025-02-03 21:33:40" },
            areas: { type: :array, items: {
              type: :object,
              properties: {
                id: { type: :number, example: 1 },
                name: { type: :string, example: "area_test" }
              }
            }}
          }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data['deleted_at']).to be_present
          end
        end
      end
      describe '異常終了テスト' do
        let(:params) { { id: 999 } }
        response '404', 'Not Found' do
          schema type: :object, properties: {
            error: { type: :string, example: 'Not Found' }
          }
          run_test! do |response|
            data = JSON.parse(response.body)
            expect(data['error']).to be_present
          end
        end
      end
    end
  end
end
