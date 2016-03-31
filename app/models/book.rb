class Book < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true

	default_scope -> { order('created_at DESC') }

	has_many :chapters, dependent: :destroy
end
