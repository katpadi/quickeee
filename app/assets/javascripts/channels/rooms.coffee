$(document).ready ->
  messages_to_bottom = undefined
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = ->
      messages.scrollTop messages.prop('scrollHeight')
    messages_to_bottom()
    App.global_chat = App.cable.subscriptions.create({
      channel: 'ChatRoomsChannel'
      chat_room_id: messages.data('chat-room-id')
    },
      connected: ->
      disconnected: ->
      received: (data) ->
        messages.append data['message']
        messages_to_bottom()
      send_message: (message, chat_room_id) ->
        @perform 'send_message',
          message: message
          chat_room_id: chat_room_id
    )
    return $('#message_body').keypress((e) ->
      console.log("Enter key...........")
      if e.which == 13 || e.keyCode == 13
        if $.trim($(this).val()).length > 1
          App.global_chat.send_message $(this).val(), messages.data('chat-room-id')
          $(this).val ''
        e.preventDefault()
        false
      return
    )
  return
