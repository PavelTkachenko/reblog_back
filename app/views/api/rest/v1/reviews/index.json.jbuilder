json.reviews do
  json.array! @reviews do |review|
    preview_text = ActionView::Base.full_sanitizer.sanitize(review.text)
    json.id review.id
    json.title review.title
    json.preview preview_text.try(:truncate, 200)
    json.author review.author_title
    json.image review.image.thumb.url
  end
end
