class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order(:name)
  end

  def new
    @director = Director.new
  end

  def create
    @director = Director.new(params.require(:director)
                                   .permit(:name,
                                     :nationality,
                                     :date_of_birth,
                                     :genre_id))

    if @director.save
      redirect_to director_path(@director)
    else
      render :new
    end
  end

  def show
    @director = Director.find(params[:id])
    @genre = Genre.find(@director.genre_id)
    @movies = Movie.where(director_id: @director.id).order(:year)
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director = Director.find(params[:id])
                       .update(params
                                 .require(:director)
                                 .permit(:name,
                                         :nationality,
                                         :date_of_birth,
                                         :genre_id))
    redirect_to director_path
  end
end