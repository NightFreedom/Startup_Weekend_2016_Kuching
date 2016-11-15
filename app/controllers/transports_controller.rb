class TransportsController < ApplicationController
    before_action :authenticate_user!, only: [:show,:new,:edit]
    def show
        @transport=Transport.find(params[:id])
    end
    def index
        @transports=Transport.all
        if params[:search]
            @transports=Transport.search(params[:search])
        else
            @transports=Transport.all
        end
    end
    def new
    end
    def create
        @transport=Transport.new(transport_params)
        @transport.save

        uploaded_io=params[:transport][:picture]
        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
            @transport.image_path = uploaded_io.read
            @transport.image_name = uploaded_io.original_filename
            @transport.save
        end

        redirect_to transports_path
    end
    def destroy
        @transport=Transport.find(params[:id])
        @transport.destroy
        redirect_to user_path(current_user.id)
    end
    def edit
        @transport=Transport.find(params[:id])
    end
    def update
        @transport=Transport.find(params[:id])
        if @transport.update(transport_params)
            redirect_to transports_path
        else
            render 'edit'
        end
    end
    def rent
    end
    def result
        @transport=Transport.find(params[:id])
        @transport.client=current_user.email
        @transport.rented=true
        @transport.save
    end
    private
    def transport_params
        params.require(:transport).permit(:name, :car_plate, :year, :manufacturer, :model, :accident, :owner, :client, :rented, :payment, :cc, :used)
    end
end
