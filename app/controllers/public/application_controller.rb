class Public::ApplicationController < ApplicationController
  before_action :authenticate_member!, except: [:top, :about, :guest_sign_in]
end
