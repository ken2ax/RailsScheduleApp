class Schedule < ApplicationRecord
  def validate_end_dates_cannot_be_in_the_past
    if enddate.present? && enddate < startdate
      errors.add(:enddate,"は開始日より前の日付は設定できません")
    end
  end

  validates :title, presence: true, length: { maximum:20 }
  validates :startdate, presence: true
  validates :enddate, presence: true 
  validate :validate_end_dates_cannot_be_in_the_past
  validates :memo, length: { maximum:500 }
end
