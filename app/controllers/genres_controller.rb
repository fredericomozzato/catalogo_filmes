class GenresController < ApplicationController
  def index
    @genres = Genre.all.order(:name)
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params.require(:genre).permit(:name))
    if @genre.save
      return redirect_to genres_path
    end

    render(:new)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    update_data = params.require(:genre).permit(:name)

    if genre.update(update_data)
      return redirect_to genre_path
    end

    render(:edit)
  end
end