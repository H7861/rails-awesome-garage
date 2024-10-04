class OwnersController < ApplicationController
  def index
    @owners = Owner.all  # Get all the owners
  end

  def show
    @owner = Owner.find(params[:id])  # Find a specific owner by ID
    @cars = @owner.cars  # Get all the cars owned by this owner
  end
end
