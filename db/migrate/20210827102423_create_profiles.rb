class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false
      t.string :precious_word
      t.date :birth_date, null: false
      t.timestamps
    end
  end
end
