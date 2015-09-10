class GeodataController < ApplicationController
  before_action :set_geodatum, only: [:show, :edit, :update, :destroy]

  # GET /geodata
  # GET /geodata.json
  def index
    @geodata = Geodatum.all
  end

  # GET /geodata/1
  # GET /geodata/1.json
  def show
  end

  # GET /geodata/new
  def new
    @geodatum = Geodatum.new
  end

  # GET /geodata/1/edit
  def edit
  end

  # POST /geodata
  # POST /geodata.json
  def create
    @geodatum = Geodatum.new(geodatum_params)

    respond_to do |format|
      if @geodatum.save
        format.html { redirect_to @geodatum, notice: 'Geodatum was successfully created.' }
        format.json { render :show, status: :created, location: @geodatum }
      else
        format.html { render :new }
        format.json { render json: @geodatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geodata/1
  # PATCH/PUT /geodata/1.json
  def update
    respond_to do |format|
      if @geodatum.update(geodatum_params)
        format.html { redirect_to @geodatum, notice: 'Geodatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @geodatum }
      else
        format.html { render :edit }
        format.json { render json: @geodatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geodata/1
  # DELETE /geodata/1.json
  def destroy
    @geodatum.destroy
    respond_to do |format|
      format.html { redirect_to geodata_url, notice: 'Geodatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geodatum
      @geodatum = Geodatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geodatum_params
      params.require(:geodatum).permit(:id, :ark, :image_id, :guid, :bib_id, :item_type, :file_list, :solr_doc_created, :solr_doc_source, :bbox, :bbox_source, :ingest_geoserver, :ingest_solr, :ingest_loris, :copyright, :access, :title, :publisher, :author, :description, :pub_info, :year)
    end
end
