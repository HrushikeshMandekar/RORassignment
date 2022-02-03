# frozen_string_literal: true

class Tutor < ActiveRecord::Base
  belongs_to :course
  validates :name, presence: true, length: {minimum: 3}
end
