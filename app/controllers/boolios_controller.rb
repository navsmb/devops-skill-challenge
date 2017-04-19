class BooliosController < ApplicationController
  before_action :set_boolio, only: [:show, :edit, :update, :destroy]

  # GET /boolios
  # GET /boolios.json
  def index
    @boolios = Boolio.all
  end

  # GET /boolios/1
  # GET /boolios/1.json
  def show

    # Get random gif from Giphy (http://giphy.com)
    response = HTTParty.get('http://api.giphy.com/v1/gifs/search?' +
      'q=' + @boolio.val.to_s +
      '&api_key=dc6zaTOxFJmzC' + # provided for public beta testing via (https://github.com/Giphy/GiphyAPI#public-beta-key)
      '&limit=1' + # only want 1
      '&offset=' + rand(30).to_s + # pull from the top 10 most relevant images
      '&rating=pg' + # afraid if this is any higher
      '&fmt=json' # seems to return JSON anyway, but just in case
    )

    if response.code == 200

      # conver to JSON
      json = JSON.parse response.body, object_class: OpenStruct

      # set image from returned results
      @image = json.data[0].images if json.data.count > 0
    end
    
  end

  # GET /boolios/new
  def new
    @boolio = Boolio.new
  end

  # GET /boolios/1/edit
  def edit
    @boolio.verify_with_api
  end

  # POST /boolios
  # POST /boolios.json
  def create

    # create local record (to keep for later purposes)
    @boolio = Boolio.new( 
      val: boolio_params[:val] == '1'
    )

    respond_to do |format|
      if @boolio.save
        format.html { redirect_to @boolio, notice: 'Boolio was successfully created.' }
        format.json { render :show, status: :created, location: @boolio }
      else
        format.html { render :new }
        format.json { render json: @boolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boolios/1
  # PATCH/PUT /boolios/1.json
  def update
    respond_to do |format|
      if @boolio.update( boolio_params )
        format.html { redirect_to @boolio, notice: 'Boolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @boolio }
      else
        format.html { render :edit }
        format.json { render json: @boolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boolios/1
  # DELETE /boolios/1.json
  def destroy
    @boolio.destroy
    respond_to do |format|
      format.html { redirect_to boolios_url, notice: 'Boolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boolio
      @boolio = Boolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boolio_params
      params.require(:boolio).permit(:val, :id)
    end
end
