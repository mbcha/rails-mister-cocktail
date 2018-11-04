class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :stars
      t.string :error, default: "Both the title and the rating must be filled"
      t.references :cocktail, foreign_key: true

      t.timestamps
    end
  end
end
