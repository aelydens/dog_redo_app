class DogsController < ApplicationController
  def new
    @user = User.find(params[:user_id]) #need user_id since we are in the dogs controller
    @dog = Dog.new
  end

  def create
    @user = User.find(params[:user_id])
    @dog = Dog.new(dog_params.merge(user_id: @user.id))
    if @dog.save
      flash[:notice] = "New dog created"
      redirect_to user_dog_path(@user, @dog)
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
    @toy = Toy.new #toy new is here because the new toy form is on the dog#show page
    @appointment = Appointment.new
  end

  private

  def dog_params
    params.require(:dog).permit(:name)
  end

end
