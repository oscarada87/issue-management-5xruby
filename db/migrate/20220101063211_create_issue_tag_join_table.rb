class CreateIssueTagJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_tag_join_tables do |t|
      t.references :tag, null: false, index: true
      t.references :issue, null: false, index: true
    end
  end
end
