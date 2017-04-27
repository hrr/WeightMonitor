class User < ApplicationRecord
  has_many :weights, dependent: :destroy
end
