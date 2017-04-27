class Weight < ApplicationRecord
  attr_accessor :date, :time
  before_save :merge_datetime
  belongs_to :user
  default_scope -> { order(registered: :desc) }

  def merge_datetime
    self.registered = "#{date} #{time}"
  end
end
