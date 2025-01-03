class Api::V1::ClientsController < ApplicationController
  def search
    # TODO
  end

  def detail
    client = Client.find_by(id: params[:id])
    if client.nil?
      render status: 404
    else
      render json: { client: client }, status: 200
    end
  end

  def update
    client = Client.find_by(id: params[:id])
    if client.nil?
      render status: 404
    else
      if client.update(client_params)
        render json: { client: client }, status: 200
      else
        render status: 400
      end
    end
  end

  def delete
    client = Client.find_by(id: params[:id])
    if client.nil?
      render status: 404
    else
      if client.destroy
        render status: 204
      else
        render status: 400
      end
    end
  end

  private
  def client_params
    params.permit(:name, :avatar, :name, :gender, :tel, :client_name, :url_x, :years_of_experience, :fee_min, :fee_max, :payment_account, :notices)
  end
end
