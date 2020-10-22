class Course < ActiveRecord::Base
    belongs_to :student
    validates :title, presence: true, uniqueness: true

    def slug
        self.title.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
        Course.all.find{ |course| course.slug == slug }
    end
end