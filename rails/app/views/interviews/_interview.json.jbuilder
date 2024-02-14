json.extract! interview, :id, :job_application_id, :interview_at, :interview_type, :details, :interviewers_info, :url, :created_at, :updated_at
json.url interview_url(interview, format: :json)
