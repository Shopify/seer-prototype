json.extract! metric, :id, :name, :value, :kind, :project_id, :created_at, :updated_at
json.url metric_url(metric, format: :json)
