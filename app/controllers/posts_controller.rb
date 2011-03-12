class PostsController < ApplicationController

	before_filter :load_categories, :except => [:index, :show, :destroy]

	respond_to :html,:xml
  # GET /posts
  # GET /posts.xml
  

def index
    @posts = Post.all

    respond_with @posts  
end

def search
	@posts = Post.where(["name LIKE ?", "%#{params[:query]}%"])
	render :index
end
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_with @posts
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_with @posts
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])

		respond_with @posts  
	end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    flash[:notice] = 'Post was sucessfully created.' if @post.save
	  respond_with @post, :location => posts_url
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    flash[:notice] = 'Post was sucessfully updated.' if
@post.update_attributes(params[:post]) 
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

	private
	def load_categories
		@categories = Category.all	
	end
end
