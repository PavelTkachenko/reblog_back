require 'test_helper'

module Api
  module Rest
    module V1
      module Reviews
        class IndexTest < ActionDispatch::IntegrationTest
          def test_index
            mov1 = Movie.create(title: 'Star Wars')
            mov2 = Movie.create(title: 'Mad Max')
            auth = Author.create(title: 'Ivanov')
            rev1 = mov1.reviews.create(title: 'Star Wars is cool', author: auth)
            rev2 = mov2.reviews.create(title: 'Mad Max is cool', author: auth)
            get api_rest_v1_reviews_path
            assert_response :success
            # assert_equal(
            #   { reviews:
            #     [
            #       {
            #         id: rev2.id,
            #         title: rev2.title,
            #         author: auth.title
            #       },
            #       {
            #         id: rev1.id,
            #         title: rev1.title,
            #         author: auth.title
            #       }
            #     ]
            #   }.to_json, response.body
            # )
          end

          def test_index_take_size
            mov = Movie.create(title: 'Star Wars')
            aut = Author.create(title: 'Ivanov')
            21.times { |n| Review.create(title: "Review#{n}", movie: mov, author: aut) }
            get api_rest_v1_reviews_path
            assert_response :success
            assert_equal(20, response.parsed_body['reviews'].size)
          end

          def test_index_offset
            mov = Movie.create(title: 'Star Wars')
            aut = Author.create(title: 'Ivanov')
            21.times { |n| Review.create(title: "Review#{n}", movie: mov, author: aut) }
            get api_rest_v1_reviews_path(offset: 20)
            assert_response :success
            assert_equal(1, response.parsed_body['reviews'].size)
          end
        end
      end
    end
  end
end
