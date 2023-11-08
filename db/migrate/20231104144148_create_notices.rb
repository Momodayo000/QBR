class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|

      t.string :title, null: false
      t.string :deadline, null: false
      t.text :explanation, null: false
      t.timestamps
    end
  end
end
