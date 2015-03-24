class Voicemsg < ActiveRecord::Base
	attr_accessor :voice_data

	 has_attached_file :voice, :storage => :s3

	 validates_attachment_content_type :voice, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	 before_save :decode_voice_data
	def voice_url
    	voice.url(:original)
    end
	def decode_voice_data
    # If image_data is present, it means that we were sent an image over
    # JSON and it needs to be decoded.  After decoding, the image is processed
    # normally via Paperclip.
    if self.voice_data.present?
        data = StringIO.new(Base64.decode64(self.voice_data))
        data.class.class_eval {attr_accessor :original_filename, :content_type}
        data.original_filename = self.id.to_s + ".png"
        data.content_type = "voice/png"

        self.voice = data
    end
  end
  

end
