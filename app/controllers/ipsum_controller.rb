require 'ipsum'
class IpsumController < ApplicationController
  include Ipsum::Controller
  def index
    @ipsum = ipsum_text
    respond_to do |format|
      format.html
      format.js
    end



  end

  def ipsum_text
    ipsum = ["<p>"]
    5.times do
      ipsum << ipsum_paragraph
    end

    ipsum_html = ipsum.join("</p><p>")
    ipsum_html << "</p>"
    ipsum_html
  end
end
