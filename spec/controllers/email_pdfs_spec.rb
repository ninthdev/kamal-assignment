require 'rails_helper'

RSpec.describe EmailPdfsController, type: :controller do
  describe "GET #show" do
    pending "queues a job to send email" do
      expect {
        get :show
      }.to have_enqueued_job(SendMailJob)
    end

    it "redirects to home index path" do
      get :show
      expect(response).to redirect_to(home_index_path)
    end

    it "sets a notice flash message" do
      get :show
      expect(flash[:notice]).to eq("Email sent")
    end
  end
end
