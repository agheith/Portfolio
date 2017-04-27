class ProfilesController < ApplicationController

    def index
        @profile_itmes = Profile.all
    end


end
