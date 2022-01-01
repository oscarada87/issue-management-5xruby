class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :user, null: false, index: true
      t.string :title

      t.timestamps
    end
  end
end
