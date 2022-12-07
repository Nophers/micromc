class ServiceController < ApplicationController

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service
    else
      render 'new'
    end
  end

  def edit
    @service = find_service()
    
    # TODO: implement the edit action
  end

  def update
    @service = find_service()
    if @service.update(service_params)
      redirect_to @service
    else
      render 'edit'
    end
  end

  def destroy
    @service = find_service()
    @service.destroy
    redirect_to services_path
  end

  private
    def service_params
      params.require(:service).permit(:name, :description, :price)
    end

  def find_service
    @service = Service.find(params[:id])
  end
end