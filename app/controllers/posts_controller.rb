class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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

  # GET /posts/new
  def new
    @post = Post.new
    set_h1 "Create a New Post"
  end

  # GET /posts/1/edit
  def edit
    set_h1 "Edit a Post"
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, seo_data_attributes: [:meta_title, :meta_description, :meta_robots])
    end
end
