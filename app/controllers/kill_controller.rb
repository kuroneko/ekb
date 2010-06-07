class KillController < ApplicationController
  def show
    @kill = Kill.find(params[:id])
  end
end
