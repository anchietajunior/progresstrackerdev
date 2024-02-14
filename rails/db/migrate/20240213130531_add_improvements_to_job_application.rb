class AddImprovementsToJobApplication < ActiveRecord::Migration[7.1]
  def change
    add_column :job_applications, :improvements, :text
  end
end
