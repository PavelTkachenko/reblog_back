require 'test_helper'

module Api
  module Rest
    module V1
      module Movies
        class IndexTest < ActionDispatch::IntegrationTest
          def test_index
            mov1 = Movie.create(title: 'Star Wars')
            mov2 = Movie.create(title: 'Mad Max')
            get api_rest_v1_movies_path
            assert_response :success
            assert_equal(
              { movies:
                [
                  {
                    id: mov2.id,
                    title: mov2.title,
                    year:  mov2.year,
                    origin:  mov2.origin,
                    poster: mov2.poster.url
                  },
                  {
                    id: mov1.id,
                    title: mov1.title,
                    year:  mov1.year,
                    origin:  mov1.origin,
                    poster: mov1.poster.url
                  }
                ]
              }.to_json, response.body
            )
          end

          def test_index_take_size
            21.times { |n| Movie.create(title: "Movie#{n}") }
            get api_rest_v1_movies_path
            assert_response :success
            assert_equal(20, response.parsed_body['movies'].size)
          end

          def test_index_offset
            21.times { |n| Movie.create(title: "Movie#{n}") }
            get api_rest_v1_movies_path(offset: 20)
            assert_response :success
            assert_equal(1, response.parsed_body['movies'].size)
          end
        end
      end
    end
  end
end
