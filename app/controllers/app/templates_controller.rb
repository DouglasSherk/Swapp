class App::TemplatesController < ApplicationController
  def page
    @path = params[:path]
    render :template => 'templates/' + @path, :layout => nil
  end
end
