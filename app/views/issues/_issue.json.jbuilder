json.extract! issue, :id, :title, :content, :priority, :status, :started_at, :finished_at, :created_at, :updated_at
json.url issue_url(issue, format: :json)
