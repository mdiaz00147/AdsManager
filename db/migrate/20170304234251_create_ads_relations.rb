class CreateAdsRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :ads_relations do |t|
      t.integer :country_config_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
