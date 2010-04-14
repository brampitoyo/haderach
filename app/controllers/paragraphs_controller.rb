class ParagraphsController < ApplicationController

  def paragraph
    @paragraphs = []
    @universes = []
    @num = params[:num].to_i > 0 ? params[:num].to_i : 1
    @min = params[:min].to_i > 0 ? params[:min].to_i : 20
    @num.times do
      para = Word.paragraph(@min)
      @universes << Word.universes(para)
      @paragraphs << para
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paragraphs }
    end
  end
  
  def title
    @words = []
    @num = params[:num].to_i > 0 ? params[:num].to_i : 1
    @num.times do
      @words << Word.one
    end
    @universes = Word.universes(@words)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paragraphs }
    end
  end
    

end
