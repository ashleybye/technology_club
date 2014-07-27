class CreateNewsitems < ActiveRecord::Migration
  def change
    create_table :newsitems do |t|
      t.string :title
      t.text   :content

      t.timestamps
    end
  end
end
