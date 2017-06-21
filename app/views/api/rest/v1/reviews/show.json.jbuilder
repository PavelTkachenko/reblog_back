json.review do
  json.id @review.id
  json.title @review.title
  json.text @review.text
  json.author @review.author_title
  json.movie do |movie|
    json.id @review.movie.id
    json.title @review.movie.title
    json.description @review.movie.description
    json.year @review.movie.year
    json.origin @review.movie.origin
    json.poster @review.movie.poster.url
  end
end
