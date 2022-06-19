class Freelancer < ApplicationRecord
    scope :filter_by_price, -> (cost) { where cost: cost }
end
