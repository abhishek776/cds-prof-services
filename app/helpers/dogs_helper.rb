module DogsHelper

  def embed(youtube_url)

    if youtube_url then
      youtube_id = youtube_url.split('/').last
      youtube_id = youtube_url.split('=').last
      
      content_tag(:iframe, nil, src: "https://www.youtube.com/embed/#{youtube_id}", :allowfullscreen => "true")
    end
  end
  
end
