module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end

  def format_datetime_to_local(datetime)
    datetime.in_time_zone('Asia/Manila').strftime("%b %e, %Y %I:%M %p")
  end

  def katpadi?
    current_user.email == 'katpadillaaa@gmail.com'
  end
end


