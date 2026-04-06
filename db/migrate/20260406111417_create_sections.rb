class CreateSections < ActiveRecord::Migration[8.1]
  def change
    create_table :sections do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
