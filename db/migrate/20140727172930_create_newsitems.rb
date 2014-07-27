class CreateNewsitems < ActiveRecord::Migration
  def change
    create_table :newsitems do |t|
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
