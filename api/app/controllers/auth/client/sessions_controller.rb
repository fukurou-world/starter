class Auth::Client::SessionsController < ApplicationController
  def index
      if current_client
          render json: { is_login: true, data: current_client }
      else
          render json: { is_login: false, message: "ユーザーが存在しません" }
      end
  end
end