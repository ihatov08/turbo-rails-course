class CreateLectures < ActiveRecord::Migration[8.1]
  def change
    create_table :lectures do |t|
      t.references :section, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
