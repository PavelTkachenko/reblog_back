require 'test_helper'

module Api
  module Rest
    module V1
      module Reviews
        class ShowTest < ActionDispatch::IntegrationTest
          def test_show
            mov = Movie.create(title: 'Star Wars')
            aut = Author.create(title: 'Ivanov')
            rev = Review.create(title: 'Review!', movie: mov, author: aut)
            get api_rest_v1_review_path(rev.id)
            assert_response :success
            assert_equal(
              { review:
                {
                  id: rev.id,
                  title: rev.title,
                  text: rev.text,
                  author: aut.title,
                  movie: {
                    id: mov.id,
                    title: mov.title,
                    description: mov.description,
                    year: mov.year,
                    origin: mov.origin,
                    poster: mov.poster.url
                  }
                },
              }.to_json, response.body
            )
          end
        end
      end
    end
  end
end
