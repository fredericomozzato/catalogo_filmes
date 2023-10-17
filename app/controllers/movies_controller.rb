class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(:name)
  end

  def new
    @movie = Movie.new
  end

  def create
    movie = Movie.new(params.require(:movie)
                            .permit(:title,
                                    :synopsis,
                                    :country_of_origin,
                                    :year,
                                    :duration,
                                    :director_id,
                                    :genre_id))
    movie.save
    redirect_to movie_path(movie)
  end

  def show
    @movie = Movie.find(params[:id])
    @director = Director.find(@movie.director_id)
    @genre = Genre.find(@movie.genre_id)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(params.require(:movie)
                       .permit(:title,
                               :synopsis,
                               :country_of_origin,
                               :year,
                               :duration,
                               :director_id,
                               :genre_id))
    redirect_to movie_path(movie)
  end
end