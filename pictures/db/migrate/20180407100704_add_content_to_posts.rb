class AddContentToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content, :text, nil: true
  end
end
