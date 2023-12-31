class Course < ApplicationRecord
    has_many :users
    has_many :tests
end
