class CreateNoticeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :notice_tags do |t|
      t.references :notice, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    # 同じタグを2回保存できないようにする
    add_index :notice_tags, [:notice_id, :tag_id], unique: true
  end
end
