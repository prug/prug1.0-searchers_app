class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :body
      t.string :title
      t.integer :autor_id
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
