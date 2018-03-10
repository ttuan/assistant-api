class CreateUserComics < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comics do |t|
      t.references :user, foreign_key: true
      t.references :comic, foreign_key: true

      t.timestamps
    end
  end
end
