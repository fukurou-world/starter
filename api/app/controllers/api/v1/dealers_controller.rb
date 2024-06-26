class Api::V1::DealersController < ApplicationController
  def search
    # TODO
  end

  def detail
    dealer = Dealer.find_by(id: params[:id])
    if dealer.nil?
      render status: 404
    else
      render json: { dealer: dealer }, status: 200
    end
  end

  def update
    dealer = Dealer.find_by(id: params[:id])
    if dealer.nil?
      render status: 404
    else
      if dealer.update(dealer_params)
        render json: { dealer: dealer }, status: 200
      else
        render status: 400
      end
    end
  end

  def delete
    dealer = Dealer.find_by(id: params[:id])
    if dealer.nil?
      render status: 404
    else
      if dealer.destroy
        render status: 204
      else
        render status: 400
      end
    end
  end

  private
  def dealer_params
    params.permit(:name, :avatar, :name, :gender, :tel, :dealer_name, :url_x, :years_of_experience, :fee_min, :fee_max, :payment_account, :notices)
  end
end
