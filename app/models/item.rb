class Item < ActiveRecord::Base
	#attr_accessible :price, :name, :real, :weight, :description 

	validates :price,  numericality: { greater_than: 0, allow_nil: true } 
	validates :name, :description, presence: true

	belongs_to :category

	after_initialize {} # Item.new
	after_save       {}# Item.scve; Item.create
	after_create     {}
	after_update     {}
	after_destroy    {}
end
