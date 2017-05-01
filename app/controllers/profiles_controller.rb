class ProfilesController < ApplicationController
    layout "profile"
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit]}, site_admin: :all

    def index
        @profile_items = Profile.all
    end

    def new
        @profile_item = Profile.new
        3.times { @profile_item.technologies.build }
    end

    def create
      @profile_item = Profile.new(profile_params)

      respond_to do |format|
        if @profile_item.save
          format.html { redirect_to profiles_path, notice: 'Item was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
        @profile_item = Profile.find(params[:id])
    end

    def update
      @profile_item = Profile.find(params[:id])
      respond_to do |format|
        if @profile_item.update(profile_params)
          format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def show
        @profile_item = Profile.find(params[:id])
    end

    def destroy
      @profile_item = Profile.find(params[:id])

      @profile_item.destroy

      respond_to do |format|
        format.html { redirect_to profiles_url, notice: 'Profile item was successfully destroyed.' }
      end
    end


    private

    def profile_params
      params.require(:profile).permit(:title,
                                      :subtitle,
                                      :body,
                                       technologies_attributes: [:name]
                                     )
    end

end
