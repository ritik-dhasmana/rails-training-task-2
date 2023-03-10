class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title 
      t.belongs_to :author
      t.string :content 
      t.string :isbn
      t.date :published_at 
      t.integer :number_of_pages 
      t.timestamps
    end
  end
end
