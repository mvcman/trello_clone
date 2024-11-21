class CardsController < ApplicationController
    before_action :set_column, only: %i[new create edit update destroy]
    def new
        @card = Card.new
    end 

    def create
        @card = @column.cards.build(card_params)
        @card.user_id = "3b51f9af-3230-408a-9ac3-835592f1bdfe"
        respond_to do |format|
            if @card.save
                format.turbo_stream do 
                    render turbo_stream: [
                        # turbo_stream.prepend("#{@column.id}_cards", partial: "cards/card", locals: { card: @card }),
                        # turbo_stream.update("card_count_#{@column.id}", "(#{@column.cards.count})")
                        turbo_stream.replace(@column, partial: "columns/column", locals: { column: @column })
                    ]
                end
            end
        end
    end

    def edit
        @card = Card.find(params[:id])
    end
    
    def update
        @card = Card.find(params[:id])
        respond_to do |format|
            if @card.update(card_params)
                format.turbo_stream do
                    render turbo_stream: [
                        turbo_stream.replace(@card, partial: "cards/card", locals: { card: @card })
                    ]
                end
            end
        end 
    end 
    
    def destroy
        @card = Card.find(params[:id])
        @card.destroy
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.remove(@card), 
              turbo_stream.update("card_count_#{@column.id}", "(#{@column.cards.count})")
            ]
          end 
        end 
    end

    private 

    def card_params
        params.require(:card).permit(:title, :description)
    end 

    def set_column
        @column = Column.find(params[:column_id])
    end 
end