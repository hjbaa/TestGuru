# frozen_string_literal: true

class Admin < User
  validates :surname, presence: true
end
