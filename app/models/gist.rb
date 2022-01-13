class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :creator, class_name: 'User'
end
