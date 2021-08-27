class ChangeColumnToProfile < ActiveRecord::Migration[6.0]
    def up
      change_column :profiles, :nickname, :string, null: false, unique: true
    end
  
    def down
      change_column :profiles, :nickname, :string, null: false
    end
end
