class MeigaraMemosController < ApplicationController
  before_action :set_meigara_memo, only: %i[ show edit update destroy ]
  before_action :set_nen

  def index
    @meigara_memos = MeigaraMemo.where(nendo: @nen)
  end

  def show
  end

  def new
    @meigara_memo = MeigaraMemo.new
  end
 
  def edit
  end


  def create
    @meigara_memo = MeigaraMemo.new(meigara_memo_params)

    respond_to do |format|
      if @meigara_memo.save
        format.html { 
          redirect_to meigara_memo_path(@meigara_memo, nendo: meigara_memo_params[:nendo]),
          notice: "銘柄メモ は正常に作成されました." }
        format.json { render :show, status: :created, location: @meigara_memo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meigara_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meigara_memo.update(meigara_memo_params)
        format.html { 
          redirect_to meigara_memo_path(@meigara_memo, nendo: meigara_memo_params[:nendo]),
          notice: "銘柄メモは正常に更新されました" }
        format.json { render :show, status: :ok, location: @meigara_memo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meigara_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meigara_memo.destroy
    respond_to do |format|
      format.html { 
        redirect_to meigara_memos_path(nendo: params[:nendo]), 
        notice: "銘柄メモは正常に削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meigara_memo
      @meigara_memo = MeigaraMemo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meigara_memo_params
      params.require(:meigara_memo).permit(:code, :nendo, :memo)
    end

    def set_nen
      # 画面タイトル（年度）表示用
      @nen = params[:nendo]
    end

end
