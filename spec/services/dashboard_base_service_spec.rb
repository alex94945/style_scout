require "rails_helper"

describe DashboardBaseService do
  let(:user){ create(:user) }
  let(:dashboard_base_service){ DashboardBaseService.new(params, user) }

  context "when a user enters no date params" do

    let(:params){ {} }
    let(:dashboard_base_service){ DashboardBaseService.new(params, user ) }

    let(:start_date){ MerchCalendar::MerchWeek.from_date(Date.current).start_of_month }
    let(:end_date){ MerchCalendar::MerchWeek.from_date(Date.current).end_of_month }

    it 'it correctly defines start and end date' do
      expect(dashboard_base_service.start_date).to eq start_date
      expect(dashboard_base_service.end_date).to eq end_date
    end

  end


  context "when a user selects a month/year" do
    let(:params){
      {
        merch_month: 2,
        merch_year: 2017
      }
    }

    let(:start_date){ MerchCalendar.send("start_of_month", params[:merch_year], merch_month: params[:merch_month].to_i) }
    let(:end_date){ MerchCalendar.send("end_of_month", params[:merch_year], merch_month: params[:merch_month].to_i)}


    it 'it correctly defines start and end date' do
      expect(dashboard_base_service.start_date).to eq start_date
      expect(dashboard_base_service.end_date).to eq end_date
    end

  end
end
