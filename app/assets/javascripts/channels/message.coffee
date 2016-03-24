App.messages = App.cable.subscriptions.create "SingleTalkChannel",

  connected: ->
    @connectionData()
    setTimeout =>
      console.info("[cable connected] from: #{@user_from}, to: #{@user_to}, currentUser: #{@current_user}")
      @perform 'follow', {user: @current_user}
    , 1000

  received: (data) ->
    console.info("[cable received] data: #{data}")

  connectionData: ->
    selector = $(".connection-data form")
    @user_from ||= $("#from", selector).val()
    @user_to ||= $("#to", selector).val()
    @current_user ||= $("#currentUser", selector).val()


