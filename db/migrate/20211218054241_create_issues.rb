class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :content
      t.string :priority
      t.string :status
      t.date :started_at
      t.date :finished_at

      t.timestamps
    end
  end
end
