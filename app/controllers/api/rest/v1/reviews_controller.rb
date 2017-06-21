module Api
  module Rest
    module V1
      class ReviewsController < BaseController
        DEFAULT_OFFSET = 0
        DEFAULT_LIMIT  = 20

        def index
          params[:offset] ||= DEFAULT_OFFSET
          params[:limit]  ||= DEFAULT_LIMIT
          @reviews = Review.all
                           .order(created_at: :desc)
                           .offset(params[:offset])
                           .take(params[:limit])
        end

        def show
          @review = Review.includes(:movie, :author).find(params[:id])
        end
      end
    end
  end
end
