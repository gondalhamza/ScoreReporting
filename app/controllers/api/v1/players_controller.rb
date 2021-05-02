class Api::V1::PlayersController < Api::V1::BaseController

  def create
    if @player.nil?
      @player = Player.create!(player_params)
    end
    json_response(player: @player, reservation: @guest.create_player!(reservation_params.merge(guest_id: @guest.id)))
  end

  private
  def player_params
    params.permit( :name)
  end
end
