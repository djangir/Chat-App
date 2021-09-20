json.extract! project_comment, :id, :user_id, :text, :created_at, :updated_at
json.url project_comment_url(project_comment, format: :json)
