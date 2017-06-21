require 'test_helper'

module Api
  module Rest
    module V1
      module Movies
        class ShowTest < ActionDispatch::IntegrationTest
          def test_show
            mov = Movie.create(title: 'Star Wars')
            get api_rest_v1_movie_path(mov.id)
            assert_response :success
            assert_equal(
              { movie:
                {
                  id: mov.id,
                  title: mov.title,
                  description: mov.description,
                  year:  mov.year,
                  origin:  mov.origin,
                  poster: mov.poster.url,
                  reviews: []
                },
              }.to_json, response.body
            )
          end

          def test_show_with_reviews
            mov = Movie.create(title: 'Star Wars')
            aut = Author.create(title: 'Ivanov')
            rev = mov.reviews.create(author: aut, title: 'Cool Review')
            get api_rest_v1_movie_path(mov.id)
            assert_response :success
            assert_equal(
              { movie:
                {
                  id: mov.id,
                  title: mov.title,
                  description: mov.description,
                  year:  mov.year,
                  origin:  mov.origin,
                  poster: mov.poster.url,
                  reviews: [
                    {
                      id: rev.id,
                      title: rev.title,
                      preview: nil,
                      image: nil,
                      author: aut.title
                    }
                  ]
                },
              }.to_json, response.body
            )
          end
        end
      end
    end
  end
end
