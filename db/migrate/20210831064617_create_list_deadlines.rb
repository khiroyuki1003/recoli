class CreateListDeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :list_deadlines do |t|
      t.date :list_dead_line_date, null: false
      t.time :list_dead_line_time, null: false
      t.references :list, null: false, foreign_key: true
      t.timestamps
    end
  end
end
