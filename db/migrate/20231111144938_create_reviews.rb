class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :notice, null: false, foreign_key: true
      t.string :content
      t.integer :score

      t.timestamps
    end
  end
end
