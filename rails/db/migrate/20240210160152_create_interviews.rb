class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.references :job_application, null: false, foreign_key: true
      t.date :interview_at
      t.integer :interview_type
      t.text :details
      t.text :interviewers_info
      t.string :url

      t.timestamps
    end
  end
end
