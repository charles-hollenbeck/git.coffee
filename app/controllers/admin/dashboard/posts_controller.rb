class Admin::Dashboard::PostsController < AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  # GET /admin/dashboard/posts
  def index
    @posts = Post.all
  end

  # GET /admin/dashboard/posts/1
  def show
  end

   # GET /admin/dashboard/posts/new
  def new
    @post = Post.new
    #set_h1 "Create a New Post"
  end

  # GET /admin/dashboard/posts/1/edit
  def edit
    #set_h1 "Edit a Post"
  end

  # POST /admin/dashboard/posts
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

  # PATCH/PUT /admin/dashboard/posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/dashboard/posts/1
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
