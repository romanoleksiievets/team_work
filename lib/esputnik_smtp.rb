class EsputnikSmtp

  def deliver!(message)
    deliver_type = message.header["deliver_type"]
    if deliver_type == "api"
      url = "http://mansel/esb-sunpower/outbound/emailService/"
      username = "mensalTemplate"
      password = "gateway13"
      rest_resource = RestClient::Resource.new(url, username, password)
      rest_resource.post prepare_payload(message), :content_type => "application/xml"
    else
      mail.perform_deliveries = false
    end
  end

   def prepare_payload message
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
      <emailRequest>
        <payload>
          <from>#{message.from.first}</from           <to>#{message.to.join(';')}</to   <cc>#{message.cc.join(';') unless message.cc.nil?}</cc           <bcc>#{message.bcc.join(';') unless message.bcc.nil?}</bcc           <replyTo>#{message.reply_to.first.to_s unless message.reply_to.nil?}</replyTo           <subject>#{message.subject.to_s unless message.subject.nil?}</subject           <body>#{message.body.to_s}</body           <contentType>text/html</contentType>
        </payload>
        <messageType>default</messageType>
      </emailRequest>"
  end

end
