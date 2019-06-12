App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  connected: ->
    console.log('Conectado')

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alertify.set('notifier','position', 'bottom-right')
    alertify.notify('<a href="/received_questions">'+data['body']+'</a>', 'red', 10)
