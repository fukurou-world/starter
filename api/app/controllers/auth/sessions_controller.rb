class Auth::SessionsController < ApplicationController
  def index
      if current_dealer
          render json: { is_login: true, data: current_dealer }
      else
          render json: { is_login: false, message: "ユーザーが存在しません" }
      end
  end
end