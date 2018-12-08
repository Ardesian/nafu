class ShiftsChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    user_connected
  end

  def unsubscribed
    user_disconnected
  end

  def pong(data: nil)
    user_connected(send_list: false)
  end

  private

  def retrieve_user_list
    Rails.cache.fetch("login_queue") { {} } || {}
  end

  def write_user_list(user_list)
    Rails.cache.write("login_queue", user_list)
  end

  def remove_expired_users
    pending_users = retrieve_user_list
    pending_users.reject! { |uid, data| data[:last_ping] < 30.seconds.ago }
    write_user_list(pending_users)
  end

  def send_user_list
    remove_expired_users
    pending_users = retrieve_user_list

    # rendered_message = ChatController.render(partial: "chat/online_list", locals: { usernames: Rails.cache.fetch("mods_chatting") { {} } })
    # ActionCable.server.broadcast "shifts:1", users: rendered_message
  end

  def user_disconnected
    pending_users = retrieve_user_list
    pending_users.delete(current_user.id)
    write_user_list(pending_users)
  end

  def user_connected(send_list: true)
    pending_users = retrieve_user_list
    pending_users[current_user.id] = { last_ping: Time.current }
    write_user_list(pending_users)
    binding.pry

    send_user_list if send_list
  end
end
