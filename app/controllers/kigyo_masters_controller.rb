class KigyoMastersController < ApplicationController
  before_action :set_kigyo_master, only: %i[ show edit update destroy ]

  # GET /kigyo_masters or /kigyo_masters.json
  def index
    @kigyo_masters = KigyoMaster.all
  end

  # GET /kigyo_masters/1 or /kigyo_masters/1.json
  def show
  end

  # GET /kigyo_masters/new
  def new
    @kigyo_master = KigyoMaster.new
  end

  # GET /kigyo_masters/1/edit
  def edit
  end

  # POST /kigyo_masters or /kigyo_masters.json
  def create
    @kigyo_master = KigyoMaster.new(kigyo_master_params)

    respond_to do |format|
      if @kigyo_master.save
        format.html { redirect_to kigyo_master_url(@kigyo_master), notice: "企業の登録が完了しました。" }
        format.json { render :show, status: :created, location: @kigyo_master }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kigyo_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kigyo_masters/1 or /kigyo_masters/1.json
  def update
    respond_to do |format|
      if @kigyo_master.update(kigyo_master_params)
        format.html { redirect_to kigyo_master_url(@kigyo_master), notice: "企業の更新が完了しました。" }
        format.json { render :show, status: :ok, location: @kigyo_master }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kigyo_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kigyo_masters/1 or /kigyo_masters/1.json
  def destroy
    @kigyo_master.destroy

    respond_to do |format|
      format.html { redirect_to kigyo_masters_url, notice: "企業の削除が完了しました。" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kigyo_master
      @kigyo_master = KigyoMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kigyo_master_params
      params.require(:kigyo_master).permit(:code, :name, :market, :kind)
    end
end
