class Post < ActiveRecord::Base
   validates :name, :presence => true
   validates :title, :length => {:minimum =>5}

   belongs_to :category
	has_many :comments
	
end
