class KigyoMaster < ApplicationRecord
    validates :code, presence: true
    validates :name, presence: true
    validates :market, presence: true
    validates :kind, presence: true
end
