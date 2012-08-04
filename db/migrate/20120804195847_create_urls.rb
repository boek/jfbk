class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
    	t.string :long_url
    	t.string :hash_url
    	t.integer :count

      t.timestamps
    end
  end
end