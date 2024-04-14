require 'rails_helper'

RSpec.describe GenPdf do
  let(:helper) { described_class.new }

  describe "#pdf" do
    it "generates a PDF from a template" do
      allow(helper).to receive(:render_to_string).and_return("PDF content")
      allow(helper).to receive(:pdf_from_string).and_return("Generated PDF")

      pdf = helper.pdf

      expect(helper).to have_received(:render_to_string).with(
        template: 'home/index',
        layout: 'application',
        formats: [:pdf]
      )
      expect(helper).to have_received(:pdf_from_string).with("PDF content")
      expect(pdf).to eq("Generated PDF")
    end
  end

  describe "#wicked_pdf" do
    it "returns an instance of WickedPdf" do
      wicked_pdf = helper.wicked_pdf

      expect(wicked_pdf).to be_an_instance_of(WickedPdf)
    end
  end
end
