class Course < ActiveRecord::Base
	has_many :tutors
	validates :name, 
            presence: true,
	          uniqueness: { case_sensitive: false, message: "Course already exists!" }
end
