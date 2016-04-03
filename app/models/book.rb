class Book < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :name, presence: true, length: {maximum: 50}

	default_scope -> { order('updated_at DESC') }
	
	has_many :chapters, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_one :rating
end
