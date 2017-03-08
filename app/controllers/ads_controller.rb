class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :update, :destroy]

  # GET /ads
  def index
    ads = Ad.all.order(id: :desc)
    ads_fix = []
    ads.each do |ad|
      ad_countries  = ad.ads_relations
      
      ad  = ad.attributes
      ad_countries_fix  = []
      ad_countries.each do |country|
        countryIso = country.country_config.nicename
        country   = country.attributes
        country['iso'] = countryIso
        ad_countries_fix << country
      end
      ad['countries'] = ad_countries_fix
      ads_fix << ad
    end
    render json: ads_fix

  end

  # GET /ads/1
  def show
    render json: @ad
  end

  # POST /ads
  def create
    country_relations = params[:countries]
    # return render json: country_relations
    @ad = Ad.new(ad_params)
    if @ad.save
      if country_relations.present?
        country_relations.each do |country|
          ad_relation = AdsRelation.new(country_config_id: country[1],
            ad_id: @ad.id)
          ad_relation.save
        end
      end
      render json: @ad, status: :created, location: @ad
    else
      render json: @ad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ads/1
  def update
    if @ad.update(ad_params)
      render json: @ad
    else
      render json: @ad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ads/1
  def destroy
    @ad.destroy
  end
  def index_count
    # ads  = Ad.all
    # ads_fixed = []
    # ads.each do |ad|
    #   ad_count  = ad.ads_hits.count
    #   ad  = ad.attributes
    #   ad['total'] = ad_count
    #   ads_fixed << ad
    # end
    # render json: ads_fixed
    ad_select  = Ad.joins(:ads_hits).all.group(:id).group(:name,:source).size

    render json: Array(ad_select)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ad_params
      params.permit(:name, :source)
    end
end
