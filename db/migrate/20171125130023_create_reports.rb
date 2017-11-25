class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.references :status, foreign_key: true
      t.string :email
      t.string :image
      t.string :lat
      t.string :lng
      t.string :observation

      t.timestamps
    end
  end
end
