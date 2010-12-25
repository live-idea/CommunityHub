class CommunitiesController < ApplicationController
  # GET /communities
  # GET /communities.xml
  def index
    @communities = Community.all

 
  end

  # GET /communities
  # GET /communities.xml
  def my
    @membercommunities = current_user.communities.where(:community_users=>{:is_communitymember=>true})

    @owncommunities =  current_user.communities.where(:community_users=>{:is_communityadmin=>true})
  end

  def get_events
    type = params[:event_type]
    @community = Community.find(params[:id])   
    @event_collection = nil
    case type
      when 'Recent'  then @event_collection = @community.recent_events(5)
      when 'Future' then  @event_collection = @community.future_events
      when 'Past' then @event_collection= @community.past_events
      when 'Archive' then @event_collection= @community.history_events
     end

    render :update do |page|
      page.replace_html  "events_place", :partial=>"communities/events",
           :locals=>{:community => @community,
                     :events => @event_collection}
    end

  end


  # GET /communities/1
  # GET /communities/1.xml
  def show
    @community = Community.find(params[:id])
    @event_collection = @community.recent_events(5)
    @posts_collection = @community.posts
    
  end

  # GET /communities/new
  # GET /communities/new.xml
  def new
    @community = Community.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @community }
    end
  end

  # GET /communities/1/edit
  def edit
    if current_user.communities.where(:community_users=>{:is_communityadmin=>true,
       :community_id=>Community.find(params[:id])} ).count > 0
    @community = Community.find(params[:id])
    else
       flash[:alert] = 'You dont have enought rights to perform this action.'
       redirect_to my_communities_path
    end
  end

  # POST /communities
  # POST /communities.xml
  def create
    @community = Community.new(params[:community])

    @community.creator = current_user
    
    if @community.save
      @communityuser = current_user.community_users.create(:community => @community,
        :is_communityadmin=> true,
        :is_communitymember=> false
      )
      flash[:notice] = 'Community was successfully created.'
      redirect_to(@community)
    else
      render :action => "new"
    end

  end

  def join
       @community = Community.find(params[:id])
       current_user.community_users.create(:community => @community, :is_communitymember=> true)
       flash[:notice] = 'You''ve joined the ' + @community.name
        redirect_to my_communities_path
  end

  def leave
       @community = Community.find(params[:id])
       current_user.community_users.where(:community_id => @community.id,
         :is_communitymember=> true        
       ).first.destroy
       flash[:notice] = 'You''ve leaved the community ' + @community.name
        redirect_to my_communities_path
  end

  #Posts logic

  def submit_post
       @community = Community.find(params[:id])
        Post.create(:community => @community, :user=> current_user)
       flash[:notice] = 'Your post was created succsessfully'
       
  end

  # PUT /communities/1
  # PUT /communities/1.xml
  def update
    @community = Community.find(params[:id])


    if @community.update_attributes(params[:community])
      flash[:notice] = 'Community was successfully updated.'
      redirect_to(@community)
       
    else
      render :action => "edit" 
    end
    
  end

  # DELETE /communities/1
  # DELETE /communities/1.xml
  def destroy
    @community = Community.find(params[:id])
    @community.destroy
   
    redirect_to(my_communities_url, :notice => 'Community was successfully deleted.')
      
  end
end

