class PublicController < ApplicationController
  before_action :set_page, only: [:page]
  layout 'public_application'

  def index
  end

  def page
    render layout: 'public_page'
  end
end
