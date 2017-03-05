class AdsRelationsController < ApplicationController
  before_action :set_ads_relation, only: [:show, :update, :destroy]

  # GET /ads_relations
  def index
    @ads_relations = AdsRelation.all

    render json: @ads_relations
  end

  # GET /ads_relations/1
  def show
    render json: @ads_relation
  end

  # POST /ads_relations
  def create
    @ads_relation = AdsRelation.new(ads_relation_params)

    if @ads_relation.save
      render json: @ads_relation, status: :created, location: @ads_relation
    else
      render json: @ads_relation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ads_relations/1
  def update
    if @ads_relation.update(ads_relation_params)
      render json: @ads_relation
    else
      render json: @ads_relation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ads_relations/1
  def destroy
    @ads_relation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ads_relation
      @ads_relation = AdsRelation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ads_relation_params
      params.permit(:country_config_id, :ad_id)
    end
end
