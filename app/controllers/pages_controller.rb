class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :is_admin?
end
