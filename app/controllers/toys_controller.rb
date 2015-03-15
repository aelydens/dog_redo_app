class ToysController < ApplicationController
  def create
    @dog = Dog.find(params[:dog_id])
    @toy = Toy.new(toy_params.merge(dog_id: @dog.id))
    #@toy = @dog.toys.new(toy_params)
    if @toy.save
      flash[:notice] = "Hooray, new toy!"
      redirect_to dog_path(@dog)
    else
      render 'dogs/show'
    end
  end

  private

  def toy_params
    params.require(:toy).permit(:name)
  end

end
