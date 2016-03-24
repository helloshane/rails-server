class SingleTalkChannel < ApplicationCable::Channel

  def follow data
    stop_all_streams
    # stream_from "messages:user:#{data['user_from']}:user:#{data['user_to']}"
    # stream_from "messages:from_user:#{data['user_from']}:to_user:#{data['user_to']}"
    stream_from "messages:user:#{data['user']}"
  end

  def unfollow
    stop_all_streams
  end

end