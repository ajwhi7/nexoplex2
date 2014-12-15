class Node < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 150 }, uniqueness: { case_sensitive: false }
end
