class ItemsController < ApplicationController
	def index
		@items = Item.all
		render text: @items.map { |i| "#{i.name}: #{i.price} - #{i.description}" }.join("<br/>")

	end
	def create
		item_params = params.require(:item).permit(:price, :name, :real, :weight, :description)
		@item = Item.create(item_params)
	
		render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
	end
end
