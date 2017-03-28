class ListingsController < ApplicationController
  # the code will runs until there is change of gems
  #R-index
  def index
    @listings = Listing.all
  end

  #C-new
  def new
    @listing= current_user.listings.new
  end

  #C-create
  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to user_listings_path(current_user)
    # redirect_to root_path
    else
    render :new
    end
  end

  #R-show
  def show
    @listing =Listing.find(params[:id])
  end

  #U-edit
  def edit
    # @user =User.find(params[:id])
    @user = current_user
    @listing =Listing.find(params[:id])

  end

  #U-update
  def update
    @listing =Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:success] = "successfully updated listing"
      redirect_to [User.find(params[:user_id]),@listing]
    else
      flash[:danger]= "error updating listing"
      render :edit
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to user_listings_path(User.find(params[:user_id]))
  end

  private
    def listing_params
    # params.require(:listing).permit(:title, :description, :max_guests, :price)
    params.require(:listing).permit(:location, :description, :no_rooms, :no_beds)
   end



end
