class ServicesController < ApplicationController
	before_action :set_Service, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show,:new, :edit, :update, :destroy]
  before_action :require_admin, only: [:index,:show,:new, :edit]

	def index
		@services = Service.all
	end

	def edit
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

	def update
		if @service.update(service_params)
			redirect_to @service
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@service.destroy

		redirect_to services_path
	end

	private

		def set_Service
      @service = Service.find(params[:id])
    end

		def service_params
			params.require(:service).permit(:name, :description)
		end
end
