class ListsController < ApplicationController
  before_action :authenticate_user
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /lists
  def index    
    @lists = current_user.lists.all

    render json: @lists
  end

  # GET /lists/1
  def show
    render json: @list
  end

  # POST /lists
  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    # does this need to be edited so that only the list creator can update?
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
  end

  # search
  def search
    @shared_lists = List.shared
    render json: @shared_lists
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      # @list = List.find(params[:id])
      @list = current_user.lists.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
        params.require(:list).permit(:user_id, :title, :description, :shared, :id)
    end
end
