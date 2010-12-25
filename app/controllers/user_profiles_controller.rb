class UserProfilesController < ApplicationController
  # GET /user_profiles
  # GET /user_profiles.xml
  def index
    @user_profiles = UserProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_profiles }
    end
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.xml
  def show
   @user_profile = current_user.user_profile

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_profile }
    end
  end

  # GET /user_profiles/new
  # GET /user_profiles/new.xml
  def new
    @user_profile = UserProfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_profile }
    end
  end

  # GET /user_profiles/1/edit
  def edit
    @user_profile = current_user.user_profile

  end
  
  # POST /user_profiles
  # POST /user_profiles.xml
  def create
    @user_profile = UserProfile.new(params[:user_profile])

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to(@user_profile, :notice => 'User profile was successfully created.') }
        format.xml  { render :xml => @user_profile, :status => :created, :location => @user_profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_profiles/1
  # PUT /user_profiles/1.xml
  def update
    @user_profile = UserProfile.find(params[:id])


    if @user_profile.update_attributes(params[:user_profile])
      redirect_to(@user_profile, :notice => 'User profile was successfully updated.')

    else
      render :action => "edit"
    end

  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.xml
  def destroy
    @user_profile = UserProfile.find(params[:id])
    @user_profile.destroy

    respond_to do |format|
      format.html { redirect_to(user_profiles_url) }
      format.xml  { head :ok }
    end
  end
end
