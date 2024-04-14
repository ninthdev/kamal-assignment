class SendMailJob
  include Sidekiq::Job

  def perform
    SendMailMailer.notify(GenPdf.new.pdf).deliver_now
  end
end
