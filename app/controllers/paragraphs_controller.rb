class ParagraphsController < ApplicationController

    def index
      @paragraphs = []
      @universes = []
      @num = params[:num].to_i > 0 ? params[:num].to_i : 1
      @min = params[:min].to_i > 0 ? params[:min].to_i : 20
      @num.times do
        para = Word.paragraph(@min)
        @universes << Word.universes(para)
        @paragraphs << para
      end
      if true #rand(5) = 1
        @phrase << Phrase.one
      end

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @paragraphs }
      end
    end

end
