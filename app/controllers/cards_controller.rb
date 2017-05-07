class CardsController < ApplicationController

  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)
      if @card.save
        redirect_to @card, notice: "New card has been created successfully."
      else

        render 'new'
      end
  end

  def update
    @card = Card.find(params[:id])
      if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
      end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end


  private

  def set_card
    @product = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end


end
