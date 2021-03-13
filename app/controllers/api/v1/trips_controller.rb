class Api::V1::TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  # GET /trips
  def index
    if logged_in?
      @trips = current_user.trips

      render json: TripSerializer.new(@trips)
    else
      render json: {
        error: "You must be logged in to see trips"
      }
    end
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.fetch(:trip, {})
    end
end
