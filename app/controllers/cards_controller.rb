class CardsController < ApplicationController
  before_action :set_card, only: [:new, :show, :destroy]
  require "payjp"

  def new
    redirect_to card_path(current_user.id) if @card.present?
  end

  def pay #payjpとCardのデータベースを作成
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to pay_cards_path
      end
    end
  end

  def destroy #PayjpとCardデータベースを削除
    if @card.present?
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to new_card_path      
  end

  def show #Cardのデータをpayjpに送り情報を取り出す
    if @card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end


  private

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

end