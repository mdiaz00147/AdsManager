class CountryConfig < ApplicationRecord
	has_many	:ads_relations, class_name:'AdsRelation', primary_key: :id, foreign_key: :country_config_id
end
