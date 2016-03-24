class Message < ApplicationRecord

  after_commit :message_cable

  def message_cable
    ActionCable.server.broadcast broad_channel, self.content
  end

  def broad_channel
    "messages:user:#{user_to}"
  end




end
