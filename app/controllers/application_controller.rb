class ApplicationController < ActionController::API
	before_action :add_allow_credentials_headers
  	def index
  		# count_ad	=	CountryConfig.joins(:ads_hits).select(:id,:iso,:name,'ads_hits.ad_id as ad_id','ads_hits.country_config_id as country_config_id').all.group(:iso)
  		# count_ad	=	Ad.joins(:ads_hits).select(:id,:name,'ads_hits.ad_id as ad_id','ads_hits.country_config_id as country_config_id').all.group(:name)
  		count_ad	=	AdsHit.joins(:ad).joins(:country_config).select(:id,:iso,'ads.name AS ad_name').all.group(:ad_name).size
  		render json: count_ad
  	end
	def add_allow_credentials_headers                                                                                                                                                                                                                                                        
		response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'                                                                                                                                                                                                     
		response.headers['Access-Control-Allow-Credentials'] = 'true'     
	end

	def options                                                                                                                                                                                                                                                                              
		head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'                                                                                                                                                                                                         
	end
end
