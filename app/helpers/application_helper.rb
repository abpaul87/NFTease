module ApplicationHelper
  def audio_check(gallery)
    if gallery.playlist.attached?
      cl_video_tag gallery.playlist.key, source_types: :mp3, controls: true, loop: true, id: "audio"
    else
      audio_tag "elevatormus.mp3", controls: true, loop: true, id: "audio"
    end
  end

  # cl_video_tag "y35agfb6o0o5gwsubcsg8h3mmtwq", source_types: :mp3, controls: true, loop: true, id: "audio"

  # def video_check_large(nft)
  #   if nft.image_url.include?("/mp4$/")
  #     <video src='<%=nft.image_url%>', controls , loop, loading= <%= if index < 5 then 'eager' else 'auto' end %>></video>
  #   else
  #     <img src='<%=nft.image_url%>' loading=<%=if index < 5 then 'eager' else 'auto' end%>>
  #   end
  # end

  # def video_check_small(nft)
  #   if nft.image_url_small.include?("/mp4$/")
  #     <video src='<%=nft.image_url_small%>', controls , loop, %>></video>
  #   else
  #     <img src='<%=nft.image_url_small%>' loading=<%=if index < 5 then 'eager' else 'auto' end%>>
  #   end
  # end
end
