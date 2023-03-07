class MoviesController < ApplicationController
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # rails as usual
      format.text { render partial: "list", locals: { movies: @movies }, formats: [:html] }
    end
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    respond_to do |format|
      format.html { redirect_to movies_path } # rails as usual
      format.text { render partial: "movie_infos", locals: { movie: @movie }, formats: [:html]}
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year)
  end

end
