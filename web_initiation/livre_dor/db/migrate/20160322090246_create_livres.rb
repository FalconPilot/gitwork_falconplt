class CreateLivres < ActiveRecord::Migration
  def change
    create_table :livres do |t|
      t.string :msg
      t.string :username

      t.timestamps null: false
    end
  end
end
