class CountryConfigsController < ApplicationController
	def index
		@ads = CountryConfig.all
		render json: @ads
	end
	def show

		country_ads	=	CountryConfig.find_by(iso:params[:iso])
		country_ads_fix	=	[]
		if country_ads.ads_relations.present?
			country_ads.ads_relations.each do |country|
				country_ad 	=	country.ad
				country_ad 	=	country_ad.attributes
				country_ad['country_config_id']	=	country_ads.id
				country_ads_fix << country_ad
			end
		else
			country_iso 	=	CountryConfig.find_by(iso:params[:iso])
			default_ads		=	Ad.all
			default_ads.each do |country|
				country =	country.attributes
				country['country_config_id']	=	country_iso.id
				country_ads_fix << country
			end		
			
		end

		return render json: country_ads_fix

	end
end
