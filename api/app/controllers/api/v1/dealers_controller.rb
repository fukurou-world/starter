class Api::V1::DealersController < ApplicationController
  def search
    # TODO
  end

  def detail
    id = params[:id]
    @dealer = Dealer.find(id)
    if @dealer.nil?
      render json: { error: 'Not Found' }, status: :not_found
    else
      render :detail, format: 'json', handler: 'jbuilder', status: :ok
    end
  end

  def update
    id = params[:id]
    dealer = Dealer.find(id)
    if dealer.nil?
      render status: :not_found
    else
      if dealer.update(dealer_params)
        render json: { dealer: dealer }, status: :ok
      else
        render status: 400
      end
    end
  end

  def delete
    id = params[:id]
    dealer = Dealer.find(id)
    if dealer.nil?
      render json: { error: 'Not Found' }, status: :not_found
    else
      if dealer.update(deleted_at: Time.now)
        render json: dealer, status: :ok
      else
        render json: { error: 'Bad Request' }, status: :bad_request
      end
    end
  end

  def completely_delete
    id = params[:id]
    dealer = Dealer.find(id)
    if dealer.destroy
      render status: :no_content
    else
    render json: { error: 'Bad Request' }, status: :bad_request
    end
  end


  private
  def dealer_params
    params.permit(:name, :avatar, :name, :gender, :tel, :dealer_name, :url_x, :years_of_experience, :fee_min, :fee_max, :payment_account, :notices)
  end
end
