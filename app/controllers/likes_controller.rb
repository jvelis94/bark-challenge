class LikesController < ApplicationController
    before_action :set_dog

    def create
        if current_user === @dog.user
            redirect_to dogs_path, notice: "can't like your own dog"
            return
        end

        @dog.likes.where(user_id: current_user.id).first_or_create
        respond_to do |format|
            format.html { redirect_to dogs_path }
        end
    end

    private

    def set_dog
        @dog = Dog.find(params[:dog_id])
    end
end
