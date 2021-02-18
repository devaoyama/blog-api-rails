class V1::PostsController < ApplicationController
  before_action :set_post, only: %i[show edit destroy]

  def index
    posts = Post.order(created_at: :desc).limit(20)
    render json: posts
  end

  def show
    render json: @post
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post
    else
      render json: { errors: post.errorr }
    end
  end

  def edit
    if @post.update(post_params)
      render json: @post
    else
      render json: { errors: @post.errors }
    end
  end

  def destroy
    @post.destroy
    render json: @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :body)
  end
end
