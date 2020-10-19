class Course < ActiveRecord::Base
    has_many :students
    belongs_to :student
end