class ListsController < ApplicationController
    def create
        @list = List.create(list_params)
        if @list.save
            # would prefer to return just the title rather than the entire object
            render json: @list, status: :created
        else
            render json: @list.errors, status: :unprocessable_entity
        end
    end
    # edit
    # destroy
    # search
    # search only Lists where public = true

    private
    def list_params
        params.permit(:user_id, :title, :description, :public)
    end
end