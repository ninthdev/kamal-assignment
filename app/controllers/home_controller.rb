class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'home',
              layout: 'layouts/application',
              template: 'home/index',
              show_as_html: params.key?('debug'),
              disable_local_file_access: false,
              formats: [:html]
      end
    end
  end
end