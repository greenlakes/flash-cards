class PagesController < ApplicationController

    def index
        @card = Card.where('review_date <= ?', Date.today).sample
    end


    def check
        @card = Card.find(params[:id])

        if @card.translated_text == params[:review_text]
        @card.set_new_review_date

        redirect_to root_path, notice:'Правильно!'

        else

        redirect_to root_path, alert:'Неправильно!'
        end
    end


end