class ClientsController < ApplicationController

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def show
        client = find_client
        render json: client, status: :ok
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client, status: :ok
    end

    private

    def client_params
        params.permit(:id, :name, :age)
    end

    def find_client
        Client.find(params[:id])
    end

end
