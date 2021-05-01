class Public::HomesController < Public::ApplicationController
  def top
    if member_signed_in?
      @member = current_member
      @problems = @member.problems
    end
  end

  def about
  end
end
