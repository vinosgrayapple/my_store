class ItemsController < ApplicationController
	protect_from_forgery with: :null_session
	def index
		@items = Item.all
		#render text: @items.map { |i| "#{i.name}: #{i.price} - #{i.description} id:#{i.id}" }.join("<br/>")

	end
	# /items/1 GET
	def show
		if !@item = Item.where(id: params[:id]).first
			render text: "Page not found", status: 404
		end
	end
	# /items/new GET
	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
	end


	def create
		@item = Item.create(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "new"
		end
	end
	def update
		@item = Item.find(params[:id])
		@item.update_attributes(items_params)
		if @item.errors.empty?
			redirect_to item_path(@item)
		else
			render "edit"
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to action: "index"

	end


	private

def items_params

   params.require(:item).permit(:name, :price, :description, :real, :weight)

end

end
