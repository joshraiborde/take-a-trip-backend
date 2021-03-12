class ApplicationController < ActionController::API
  include ::ActionController::Cookies

    def current_user
        # currently a mocked version of "being logged in"
        # User.first
        User.find_by(id: session[:user_id])
      end
    
      def logged_in?
        !!current_user
      end

end

