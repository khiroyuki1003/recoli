json.array! @events do |event|
  json.id event.id
  json.title event.list.list_title
  json.start event.list_deadline_date
  json.url profile_category_list_path(event.profile.id, event.list.category.id, event.list.id)
end