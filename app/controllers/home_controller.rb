class HomeController < ApplicationController
  def index
  end

  def show
    page = params[:page] ? params[:page] : "index" 
    @index = true if page == "index"
    @paragraphs = []
    1.times do
      para = Word.paragraph
      @paragraphs << para
    end
    render :action => page
  end
end
