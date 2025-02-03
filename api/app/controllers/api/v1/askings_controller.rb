class Api::V1::AskingsController < ApplicationController
  def index
    @askings = Asking.where(client_id: params[:client_id])
    render :index, format: 'json', handler: 'jbuilder', status: :ok
  end

  def send_mail
    dealer = Dealer.find(params[:dealer_id])
    AskingMailer.send_mail_single(dealer).deliver_now
    head :ok
  end
end
