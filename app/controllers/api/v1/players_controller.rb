class Api::V1::PlayersController < Api::V1::BaseController

  include Swagger::Blocks

  before_action :set_player, only: [:score]
  before_action :parse_start_time, only: [:score]

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


  swagger_path '/players/score' do
    operation :post do
      key :summary, 'Create score for Player.'
      key :description, 'This function is used to Add  score for Player.'
      key :tags, [
          'Players'
      ]
      key :produces, [
          'application/json'
      ]
      parameter do
        key :name, 'score'
        key :in, :query
        key :description, 'This should be the score of the Player'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, 'time_spent'
        key :in, :query
        key :description, 'This should be the time spent for this score (in minutes)'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, 'started_playing'
        key :in, :query
        key :description, 'This should be the started playing time to reach this score'
        key :required, true
        key :type, :string
      end
      parameter do
        key :name, 'player_id'
        key :in, :query
        key :description, 'This should be the player id'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def score
    @score = Score.create!(score_params)

    json_response(player: @player, score: @player.scores)
  end


  private
  def player_params
    params.permit( :name)
  end

  #Score params
  def score_params
    params.permit( :started_playing, :score, :time_spent, :player_id)
  end

  def set_player
    @player = Player.find_by_id(params[:player_id])
  end

  def parse_start_time
    params[:started_playing] = params[:started_playing].to_date
  end
end
