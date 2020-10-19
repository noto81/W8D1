class PostsController < ApplicationController
   #  before_action :require_login!


    def new
        @post = Post.new 
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id 

        if @post.save 
        else
          flash[:errors] = @post.errors.full_messages 
         end

        redirect_to posts_url

    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        render :edit  
    end

    def update
        @post = current_user.posts.find_by(id: params[:id])

        if @post.update(post_params)
            redirect_to post_url(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def post_params
        params[:post][:subs_ids] ||= []
        params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end
end
