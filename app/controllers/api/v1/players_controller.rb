class Api::V1::PlayersController < Api::V1::BaseController

  include Swagger::Blocks

  swagger_path '/players' do
    operation :post do
      key :summary, 'Create Player.'
      key :description, 'This function is used to Create Player.'
      key :tags, [
          'Players'
      ]
      key :produces, [
          'application/json'
      ]
      parameter do
        key :name, 'name'
        key :in, :query
        key :description, 'This should be the Name of the Player'
        key :required, true
        key :type, :string
      end
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def create
    @player = Player.create!(player_params)

    json_response(player: @player)
  end

  private
  def player_params
    params.permit( :name)
  end
end
