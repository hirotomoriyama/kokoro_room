class Admin::HomesController < Admin::ApplicationController
  def top
    @problems = Problem.all
  end
end
