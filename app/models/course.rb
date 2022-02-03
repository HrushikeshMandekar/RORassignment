# frozen_string_literal: true

class Course < ActiveRecord::Base
  has_many :tutors

  accepts_nested_attributes_for :tutors, reject_if: proc { |attributes| attributes['name'].blank? }

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false, message: 'Course already exists!' },
            length: {minimum: 3}
end
