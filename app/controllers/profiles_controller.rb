class ProfilesController < ApplicationController

    def index
        @profile_itmes = Profile.all
    end

    def new
        @portfolio_item = Profile.new
        3.times { @portfolio_item.technologies.build }
    end

    def create
      @portfolio_item = Profile.new(portfolio_params)

      respond_to do |format|
        if @portfolio_item.save
          format.html { redirect_to profiles_path, notice: 'Item was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    def edit
        @portfolio_item = Profile.find(params[:id])
    end

    def update
      @portfolio_item = Profile.find(params[:id])
      respond_to do |format|
        if @portfolio_item.update(portfolio_params)
          format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    def show
        @portfolio_item = Profile.find(params[:id])
    end

    def destroy
      @portfolio_item = Profile.find(params[:id])

      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to profiles_url, notice: 'Profile item was successfully destroyed.' }
      end
    end


    private

    def portfolio_params
      params.require(:profile).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end

end
