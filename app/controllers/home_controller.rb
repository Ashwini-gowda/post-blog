class HomeController < ApplicationController
	
	def index
			#@posts = Post.all.order("created_at DESC")#.page(params[:page]).per(15)
			@posts = Post.paginate(page: params[:page], per_page: 5).all.order("created_at DESC")
	end
	def store
					@post = Post.new({:title => params[:title], :body => params[:body], :author => params[:author],  :media => params[:media]})
				@post.save
				redirect_to('/')
	end
end
