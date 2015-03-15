class AppointmentsController < ApplicationController
  def create
    #@dog = Dog.find(params[:dog_id])
    #@appointment = Appointment.new(appointment_params.merge(dog_id: @dog.id))
    @appointment = Appointment.new(appointment_params.merge(dog_id: params[:dog_id]))
    if @appointment.save
      flash[:notice] = "You've made an appointment"
      redirect_to dog_path(params[:dog_id])
    else
      render "dogs/show"
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time, :vet_id)
  end

end
