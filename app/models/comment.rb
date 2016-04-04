class Comment < ActiveRecord::Base
	belongs_to :book
	belongs_to :user
	acts_as_votable
end