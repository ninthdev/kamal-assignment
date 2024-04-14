require 'rails_helper'

RSpec.describe SendMailJob do
  describe "#perform" do
    it "sends an email with PDF content" do
      gen_pdf = instance_double("GenPdf", pdf: "PDF content")
      allow(GenPdf).to receive(:new).and_return(gen_pdf)

      expect(SendMailMailer).to receive(:notify).with("PDF content").and_return(mailer)

      SendMailJob.new.perform
    end
  end
end
