class AddAvaliationToJobApplications < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :avaliation, :integer
  end
end
