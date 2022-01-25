# frozen_string_literal: true

class BadgesUsers < ApplicationRecord
  belongs_to :user
  belongs_to :badge
end
