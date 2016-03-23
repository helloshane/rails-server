module ApplciationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user_id

    def connect
    end

    protected
      def find_verified_user
        if user = User.find_by(id: cookies.signed[:user_id])
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  
  end
end