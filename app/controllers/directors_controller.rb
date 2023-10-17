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
      redirect_to directors_path
    else
      render :new
    end
  end
end