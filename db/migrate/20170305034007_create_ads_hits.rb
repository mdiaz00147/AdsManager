class CreateAdsHits < ActiveRecord::Migration[5.0]
  def change
    create_table :ads_hits do |t|
      t.integer :ad_id
      t.integer :country_config_id

      t.timestamps
    end
  end
end
