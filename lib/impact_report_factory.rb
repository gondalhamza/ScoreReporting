
# Module to handle Impact report
module ImpactReportFactory

  # objects parsing a kind of View Model to be used in Json
  class PlayerReport
    attr_accessor :total_time_played, :number_of_playthroughs, :score_difference, :player_name,  :player_id, :created_at

    #Impact object
    def self.impact_object(object)
      {
          player_id: object.id,
          player_name: object.name,
          total_time_played: object.total_time_played,
          number_of_playthroughs: object.number_of_playthroughs,
          score_difference: object.score_difference,
          created_at: object.created_at
      }
    end
  end

end