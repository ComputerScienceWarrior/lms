class Student < ActiveRecord::Base
    has_secure_password
    has_many :courses
    validates :username, presence: true, uniqueness: true

    def slug
        self.username.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        User.all.find{ |user| user.slug == slug }
    end
end