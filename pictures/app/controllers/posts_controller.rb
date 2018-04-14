class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:show, :edit, :update,:destroy]

  def index
    @posts = Post.all.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update
      redirect_to :edit
    else
      render posts_path
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def owned_post
      unless current_user.id == @post.user_id
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
        # binding.pry
      end
    end
end
