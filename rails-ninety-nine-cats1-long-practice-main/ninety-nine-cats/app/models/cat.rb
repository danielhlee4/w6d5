class Cat < ApplicationRecord
    CAT_COLORS = black, white, orange, brown, grey
    # CAT_COLORS = ("black", "white", "orange", "brown", "grey")


    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inlcusion: {in: %w(CAT_COLORS)}
end
