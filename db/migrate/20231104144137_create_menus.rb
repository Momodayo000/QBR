class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.string :menu_title, null: false
      t.string :menu_sub_title, null: false
      t.text :menu_explanation, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
