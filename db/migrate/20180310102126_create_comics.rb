class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :name
      t.string :url
      t.datetime :updated_at

      t.timestamps
    end
  end
end
