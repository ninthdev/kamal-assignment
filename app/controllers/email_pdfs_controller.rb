class EmailPdfsController < ApplicationController

  def show
    SendMailJob.perform_async
    redirect_to home_index_path, notice: "Email sent"
  end
end