class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts
  def index
    @posts = Post.all.order(:created_at => :desc)
    set_h1 "Web Developement Blog"
  end

  # GET /posts/1
  def show
    if @post.seo_data.meta_title.empty?
      set_title @post.name
    else
      set_title @post.seo_data.meta_title
    end

    set_h1 @post.name # To do: Create H1 field in SEO Table
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, seo_data_attributes: [:meta_title, :meta_description, :meta_robots, :seo_h1])
    end
end
