class ImageGenerationTool < RubyLLM::Tool
  include ActionView::Helpers::TagHelper

  description "Generate an image based on the given prompt. The image will be returned as a HTML image tag. You must always return a valid HTML image tag."
  
  param :prompt, 
        type: :string, 
        desc: <<~DESCRIPTION
          The prompt to generate an image from, e.g: 'kitten, blue eyes, fluffy' or 'a photo of a cat'. 
          The image will be returned as a HTML image tag. You must always return a valid HTML image tag. 
          Add a <br> tag before and after the image tag to make it easier to read.
        DESCRIPTION

  def execute(prompt:)
    image_response = RubyLLM.paint(prompt, size: "1024x1024")

    tag.img(src: image_response.url, class: "w-full h-full object-cover", width: 512, height: 512)
  end
end
