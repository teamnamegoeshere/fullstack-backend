class ListsController < ApplicationController
    def create
        @list = List.create(list_params)
        if @list.save
            render json: @list.title, status: :created
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end


    private
    def list_params
        params.permit(:user_id, :title, :description, :public)
    end
end