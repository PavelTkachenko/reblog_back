module Api
  module Rest
    module V1
      class MoviesController < BaseController
        DEFAULT_OFFSET = 0
        DEFAULT_LIMIT  = 20

        def index
          params[:offset] ||= DEFAULT_OFFSET
          params[:limit]  ||= DEFAULT_LIMIT
          @movies = Movie.all
                         .order(:title)
                         .offset(params[:offset])
                         .take(params[:limit])
        end

        def show
          @movie = Movie.includes(reviews: :author).find(params[:id])
        end
      end
    end
  end
end
