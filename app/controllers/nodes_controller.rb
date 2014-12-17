class NodesController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :destroy]
	before_action :admin_user,     only: :destroy
	def show
		@node = Node.find(params[:id])
	end

	def new
		@node = Node.new
	end

	def create
    	@node = Node.new(node_params)    # Not the final implementation!
    	if @node.save
      		flash[:success] = "Node created."
      		redirect_to @node
    	else
      		render 'new'
    end

	end

	def edit
    	@node = Node.find(params[:id])
  	end

  	def update
    	@node = Node.find(params[:id])
    	if @node.update_attributes(node_params)
    	  flash[:success] = "Node refined"
    	  redirect_to @node
    	else
   		   render 'edit'
    	end
  	end
  
  def destroy
    Node.find(params[:id]).destroy
    flash[:success] = "Node deleted."
    redirect_to root_url
  end

    def node_params
      params.require(:node).permit(:title, :what, :when)
    end

# Before filters
    def signed_in_user
    	unless signed_in?
        store_location
      	redirect_to signin_url, notice: "Please sign in to contribute."
    	end
	end
end
