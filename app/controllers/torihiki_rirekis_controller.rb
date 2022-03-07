class TorihikiRirekisController < ApplicationController
  before_action :set_torihiki_rireki, only: %i[ show edit update destroy ]

  # GET /torihiki_rirekis or /torihiki_rirekis.json
  def index
    @torihiki_rirekis = TorihikiRireki.all
  end

  # GET /torihiki_rirekis/1 or /torihiki_rirekis/1.json
  def show
  end

  # GET /torihiki_rirekis/new
  def new
    @torihiki_rireki = TorihikiRireki.new
  end

  # GET /torihiki_rirekis/1/edit
  def edit
  end

  # POST /torihiki_rirekis or /torihiki_rirekis.json
  def create
    @torihiki_rireki = TorihikiRireki.new(torihiki_rireki_params)

    respond_to do |format|
      if @torihiki_rireki.save
        format.html { redirect_to torihiki_rireki_url(@torihiki_rireki), notice: "Torihiki rireki was successfully created." }
        format.json { render :show, status: :created, location: @torihiki_rireki }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @torihiki_rireki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /torihiki_rirekis/1 or /torihiki_rirekis/1.json
  def update
    respond_to do |format|
      if @torihiki_rireki.update(torihiki_rireki_params)
        format.html { redirect_to torihiki_rireki_url(@torihiki_rireki), notice: "Torihiki rireki was successfully updated." }
        format.json { render :show, status: :ok, location: @torihiki_rireki }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @torihiki_rireki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /torihiki_rirekis/1 or /torihiki_rirekis/1.json
  def destroy
    @torihiki_rireki.destroy

    respond_to do |format|
      format.html { redirect_to torihiki_rirekis_url, notice: "Torihiki rireki was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_torihiki_rireki
      @torihiki_rireki = TorihikiRireki.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def torihiki_rireki_params
      params.require(:torihiki_rireki).permit(:yakujobi, :meigara, :code, :market, :torihiki, :kigen, :azukari, :kazei, :count, :tanka, :tesuu, :zeigaku, :ukewatasi, :kingaku)
    end
end
