class JyotoEkiMeisaisController < ApplicationController
  before_action :set_jyoto_eki_meisai, only: %i[ show edit update destroy ]

  # GET /jyoto_eki_meisais or /jyoto_eki_meisais.json
  def index
    @jyoto_eki_meisais = JyotoEkiMeisai.all
  end

  # GET /jyoto_eki_meisais/1 or /jyoto_eki_meisais/1.json
  def show
  end

  # GET /jyoto_eki_meisais/new
  def new
    @jyoto_eki_meisai = JyotoEkiMeisai.new
  end

  # GET /jyoto_eki_meisais/1/edit
  def edit
  end

  # POST /jyoto_eki_meisais or /jyoto_eki_meisais.json
  def create
    @jyoto_eki_meisai = JyotoEkiMeisai.new(jyoto_eki_meisai_params)

    respond_to do |format|
      if @jyoto_eki_meisai.save
        format.html { redirect_to jyoto_eki_meisai_url(@jyoto_eki_meisai), notice: "Jyoto eki meisai was successfully created." }
        format.json { render :show, status: :created, location: @jyoto_eki_meisai }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jyoto_eki_meisai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jyoto_eki_meisais/1 or /jyoto_eki_meisais/1.json
  def update
    respond_to do |format|
      if @jyoto_eki_meisai.update(jyoto_eki_meisai_params)
        format.html { redirect_to jyoto_eki_meisai_url(@jyoto_eki_meisai), notice: "Jyoto eki meisai was successfully updated." }
        format.json { render :show, status: :ok, location: @jyoto_eki_meisai }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jyoto_eki_meisai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jyoto_eki_meisais/1 or /jyoto_eki_meisais/1.json
  def destroy
    @jyoto_eki_meisai.destroy

    respond_to do |format|
      format.html { redirect_to jyoto_eki_meisais_url, notice: "Jyoto eki meisai was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jyoto_eki_meisai
      @jyoto_eki_meisai = JyotoEkiMeisai.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jyoto_eki_meisai_params
      params.require(:jyoto_eki_meisai).permit(:code, :name, :torikesi, :yakujo_bi, :count, :torihiki, :ukewatasi, :baikyaku, :hiyo, :syutoku_bi, :sinki_gaku, :son_eki_gaku, :chiho)
    end
end
