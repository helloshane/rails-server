module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user_id

    def connect
      self.current_user_id = find_verified_user
      logger.add_tags 'ActionCable', current_user_id      
    end

    protected
      def find_verified_user
        cookies.signed[:user_id] || nil
        # if user = User.find_by(id: cookies.signed[:user_id])
        #   verified_user
        # else
        #   reject_unauthorized_connection
        # end
      end
  
  end
end