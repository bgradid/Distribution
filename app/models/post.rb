class Post < ActiveRecord::Base
	validates :name, :presence => true
	validates :title, :presence => true,
					  :length => { :minimum => 5 }
	validates :content, :presence => true,
					   :length => { :minimum => 5 }
	def status
		if self.title = "asdfasdfas"
			"Conditinal is true"
		else
			"Conditinal is FALSE"
		end
	end
end
