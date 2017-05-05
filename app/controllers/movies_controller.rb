class MoviesController < ApplicationController

#READ
  def index
    @movies = Movie.all
    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params["id"])
    render("movies/show.html.erb")
  end

#CREATE
  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params["title"]
    @movie.year = params["year"]
    @movie.duration = params["duration"]
    @movie.description = params["description"]
    @movie.image_url = params["image_url"]
    @movie.director_id = params["director_id"]

    @movie.save

    render("movies/show.html.erb")
  end

#UPDATE
  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find(params["id"])
    @movie.title = params["title"]
    @movie.year = params["year"]
    @movie.duration = params["duration"]
    @movie.description = params["description"]
    @movie.image_url = params["image_url"]
    @movie.director_id = params["director_id"]
    @movie.save

    render("movies/show.html.erb")
  end

#DELETE
  def destroy
    movie = Movie.find(params["id"])
    @movietitle = movie.title
    movie.destroy

    render("movies/destroy.html.erb")
  end
end
