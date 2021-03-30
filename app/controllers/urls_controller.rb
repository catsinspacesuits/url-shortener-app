class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create 
    @url = Url.new(urls_params)
    if @url.save
      redirect_to url_path(@url), notice: "Saved!"
    else
      render "new"
    end
  end 

  def show
    @url = Url.find(params[:id])
  end

  def redirect_to_original
    @url = Url.find_by_short_url(params[:short_url])
    redirect_to @url.original_url
  end
  
  private

  def urls_params
    params.require(:url).permit(:original_url, :short_url)
  end
end
