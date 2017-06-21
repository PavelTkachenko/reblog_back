json.movies do
  json.array! @movies do |movie|
    json.id movie.id
    json.title movie.title
    json.year movie.year
    json.origin movie.origin
    json.poster movie.poster.url
  end
end
