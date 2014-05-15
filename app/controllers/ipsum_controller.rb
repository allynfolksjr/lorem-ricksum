require 'ipsum'
class IpsumController < ApplicationController
  include Ipsum::Controller
  def index
    @ipsum = ["<p>"]
    5.times do
      @ipsum << ipsum_paragraph
    end

    @ipsum_html = @ipsum.join("</p><p>")
    @ipsum_html << "</p>"

  end

  def get_ipsum
  end
end
