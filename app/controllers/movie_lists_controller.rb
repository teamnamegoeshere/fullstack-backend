class MovieListsController < ApplicationController
  before_action :set_movie_list, only: [:show, :update, :destroy]

  # GET /movie_lists
  def index
    @movie_lists = MovieList.all

    render json: @movie_lists
  end

  # GET /movie_lists/1
  def show
    render json: @movie_list
  end

  # POST /movie_lists
  def create
    @movie_list = MovieList.new(movie_list_params)

    if @movie_list.save
      render json: @movie_list, status: :created, location: @movie_list
    else
      render json: @movie_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_lists/1
  def update
    if @movie_list.update(movie_list_params)
      render json: @movie_list
    else
      render json: @movie_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_lists/1
  def destroy
    @movie_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_list
      @movie_list = MovieList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_list_params
      params.fetch(:movie_list, {})
    end
end
