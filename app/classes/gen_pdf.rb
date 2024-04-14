class GenPdf < SimpleDelegator

  def initialize
    super ActionController::Base.new
  end

  def pdf
    @pdf ||= pdf_from_string(
      render_to_string(
        template: 'home/index',
        layout: 'application',
        formats: [:pdf]
      )
    )
  end

  def wicked_pdf
    @wicked_pdf ||= WickedPdf.new
  end

  delegate :pdf_from_string, to: :wicked_pdf
end