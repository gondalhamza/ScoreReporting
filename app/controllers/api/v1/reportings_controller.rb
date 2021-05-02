class Api::V1::ReportingsController < Api::V1::BaseController

  include Swagger::Blocks

  swagger_path '/weekly' do
    operation :get do
      key :summary, 'weekly summary.'
      key :description, 'This function is used to see Weekly summary.'
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
  def weekly
  end

  swagger_path '/impact' do
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
  end

end
