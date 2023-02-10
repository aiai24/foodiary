class PostsController < ApplicationController
  before_action :authenticate_user!
    def index
      if params[:search] == nil 
        @posts = Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
      end
      
    end
    def new
        @post = Post.new
    end
    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
      private
      def post_params
        params.require(:post).permit(:body)
      end
end