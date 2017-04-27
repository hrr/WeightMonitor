class Weight < ApplicationRecord
  belongs_to :user
  default_scope -> { order(registered: :desc) }
end
