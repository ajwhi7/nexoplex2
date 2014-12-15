class NodesController < ApplicationController
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
    	@node = Node.find
  	end
    def node_params
      params.require(:node).permit(:title, :what, :when)
    end

end
