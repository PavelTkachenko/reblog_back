json.movie do
  json.id @movie.id
  json.title @movie.title
  json.description @movie.description
  json.year @movie.year
  json.origin @movie.origin
  json.poster @movie.poster.url
  json.reviews do
    json.array! @movie.reviews do |review|
      preview_text = ActionView::Base.full_sanitizer.sanitize(review.text)
      json.id review.id
      json.title review.title
      json.preview preview_text.try(:truncate, 200)
      json.image review.image.thumb.url
      json.author review.author_title
    end
  end
end
