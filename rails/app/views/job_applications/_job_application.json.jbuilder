json.extract! job_application, :id, :user_id, :company_name, :position, :status, :applied_at, :applied_via, :contact_name, :contact_email, :priority, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
