module ApplicationHelper
  def audio_check(gallery)
    if gallery.playlist.attached?
      cl_video_tag gallery.playlist.key, source_types: :mp3, controls: true, loop: true, id: "audio"
    else
      audio_tag "elevatormus.mp3", controls: true, loop: true, id: "audio"
    end
  end
end
