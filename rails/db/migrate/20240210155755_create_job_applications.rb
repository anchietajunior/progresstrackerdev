class CreateJobApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :job_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :position
      t.integer :status, default: 0
      t.date :applied_at
      t.string :applied_via
      t.string :contact_name
      t.string :contact_email
      t.integer :priority, default: 0
      t.text :personal_feedback

      t.timestamps
    end
  end
end
