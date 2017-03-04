class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :source
      t.timestamps
    end
  end
end
