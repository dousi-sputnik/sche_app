class User < ApplicationRecord
    validates :title, presence: true
    validates :startday, presence: true
    validates :endday, presence: true
    validates :memo, length: { maximum: 100}

    validate :endday_after_startday
    def endday_after_startday
        if endday == nil
            errors.add(:endday,"は開始日以後の日にちを選択してください")
        
        elsif endday < startday
            errors.add(:endday,"は開始日以降の日にちを選択してください")
        else
            "新規登録完了"
        end
    end
end