class GymsController < ApplicationController

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = find_gym
        render json: gym, status: :ok
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json: gym, status: ok
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private

    def gym_params
        params.permit(:id, :name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

end
