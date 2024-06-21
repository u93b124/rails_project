class MeigaraMemo < ApplicationRecord


  # 銘柄メモTBLから（証券コード_年度ごとにメモがあれば取得する）
  def self.get_memo(code,nen)
    ret = MeigaraMemo.where(code: code, nendo: nen).pluck(:memo)
    ret[0]
  end

end
