class MultiTalkChannel < ApplicationCable::Channel

  def follow data
    stop_all_streams
    stream_from "multi/msg/to/group/#{data['to_group_id']}"
  end

  def unfollow
    stop_all_streams
  end

end

