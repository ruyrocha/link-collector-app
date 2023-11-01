json.extract! page_link, :id, :page_id, :title, :url, :created_at, :updated_at
json.url page_link_url(page_link, format: :json)
