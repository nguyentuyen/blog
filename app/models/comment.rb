class Comment < ActiveRecord::Base
	belongs_to :entry
	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, length: { maximum: 30 }
	validates :comment, presence: true, length: { maximum: 140 }
	validates :entry_id, presence: true
end
