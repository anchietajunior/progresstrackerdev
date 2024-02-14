class AddCompanyToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :company_name, :string
    add_column :job_applications, :location, :string
  end
end
