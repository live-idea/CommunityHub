class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml

  before_filter :load_commentable

  def load_commentable
    @commentable = Event.find params[:event_id] if params[:event_id]
    @commentable = Post.find params[:post_id] if params[:post_id]
  end
  
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user = current_user
    @community = @commentable.community
 
   @comment.save ? (@comment = @commentable.comments.new() and flash[:notice] = "Comment added") :  flash[:error] = "Enter comment to add it"

    render :update do |page|
      page.replace_html  :comments_id,
               :partial=>"#{@commentable.class.to_s.downcase}s/comments",
               :locals=>{:commentable => @commentable, :comment => @comment}
     
    end
   end
  
  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @community = @commentable.community
    
    @comment.destroy

    redirect_to([@community,@commentable], :notice => 'Comment was successfully deleted.')
  end
end
