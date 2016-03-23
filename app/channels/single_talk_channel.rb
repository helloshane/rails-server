class SingleTalkChannel < ApplicationCable::Channel

  def follow data
    stop_all_streams
    stream_from "single/msg/to/user/#{data['to_user_id']}"
  end

  def unfollow
    stop_all_streams
  end

end