require 'impact_report_factory'

class Api::V1::ReportingsController < Api::V1::BaseController
  include ImpactReportFactory
  include Swagger::Blocks

  swagger_path '/reportings/weekly' do
    operation :get do
      key :summary, 'weekly summary.'
      key :description, 'This function is used to see Weekly summary.'
      key :tags, [
          'Reporting'
      ]
      key :produces, [
          'application/json'
      ]
      parameter do
        key :name, 'week_no'
        key :in, :query
        key :description, 'This should be the Week number for current year'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def weekly
    @players = Player.in_range(get_starting_date_for_week, get_ending_day_for_week).limit(10)

    json_response(players: @players)
  end

  swagger_path '/reportings/impact' do
    operation :get do
      key :summary, 'impact report.'
      key :description, 'This function is used to see mpact report..'
      key :tags, [
          'Reporting'
      ]
      key :produces, [
          'application/json'
      ]
      response 200 do
        key :description, 'Successful Operation'
      end
    end
  end
  def impact
    @players = Player.all
    result = []
    @players.each do |player|
      result << ImpactReportFactory::PlayerReport.impact_object(player)
    end

    json_response(players: result)
  end


  private
  def get_starting_date_for_week
    Date.commercial(Date.today.year, params[:week_no].to_i)
  end
  def get_ending_day_for_week
    Date.commercial(Date.today.year, params[:week_no].to_i) + 6.days
  end
end
