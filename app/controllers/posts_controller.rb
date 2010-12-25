class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @community = Community.find(params[:community_id])
    @posts = Post.where(:community_id=>@community.id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
    @comment = Comment.new
    
 
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    @community = Community.find(params[:community_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
    
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    @community = Community.find(params[:community_id])
    @post.community = @community
    @post.user = current_user
   
      if @post.save
          redirect_to( [@community, @post], :notice => 'Post was successfully created.')
      end    
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @community = Community.find(params[:community_id])
    
      if @post.update_attributes(params[:post])             
         redirect_to( [@community, @post], :notice => 'Post was successfully updated.')
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(community_posts_url) }
      format.xml  { head :ok }
    end
  end
end
