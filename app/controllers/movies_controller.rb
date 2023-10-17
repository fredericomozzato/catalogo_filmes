class MoviesController < ApplicationController
  def index
    @movies = Movie.where(released: true).order(:name)
    @unreleased = Movie.where(released: false).order(:name)
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
                                    :genre_id,
                                    :released))
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
                               :genre_id,
                               :released))
    redirect_to movie_path(movie)
  end
end