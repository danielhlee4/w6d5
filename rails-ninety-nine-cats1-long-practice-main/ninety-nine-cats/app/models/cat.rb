require "action_view"

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    CAT_COLORS =["black", "white", "orange", "brown", "grey"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: %w(M F)}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        if birth_date.present? && self.birth_date > Date.today
            errors.add(:birth_date, "cannot be in the future")
        end
    end

    def age

        time_ago_in_words(self.birth_date)
    end
end