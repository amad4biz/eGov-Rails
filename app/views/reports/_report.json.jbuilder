json.extract! report, :id, :title, :description, :status_id, :email, :image, :lat, :lng, :created_at, :updated_at
json.url report_url(report, format: :json)
