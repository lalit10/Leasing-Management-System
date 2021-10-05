class HomeController < ApplicationController

  def index
    if admin_signed_in?
      redirect_to admins_path

    elsif applicant_signed_in?
      redirect_to applicants_path

    elsif leasing_agent_signed_in?
      redirect_to leasing_agents_path
    end
  end

end

