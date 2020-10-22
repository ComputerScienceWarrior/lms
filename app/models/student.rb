class Student < ActiveRecord::Base
    has_secure_password
    has_many :courses
    belongs_to :student
    validates :username, presence: true, uniqueness: true

    def slug
        self.username.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        Student.all.find{ |student| student.slug == slug }
    end
end