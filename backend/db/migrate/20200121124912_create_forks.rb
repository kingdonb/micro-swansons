class CreateForks < ActiveRecord::Migration[6.0]
  def change
    create_table :forks do |t|
      t.integer :position
      t.boolean :clean
      t.belongs_to :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
