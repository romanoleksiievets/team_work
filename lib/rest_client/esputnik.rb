module RestClient
  class Esputnik < BasicAuth
    def handshake
      get "version"
    end

    def groups
      get "groups"
    end

    def from
      get "interfaces/email"
    end

    def sms
      get "messages/sms"
    end

    def balance
      get "balance"
    end

    def contacts
      get "contacts"
    end

    def send_sms(text)
      # phone_numbers
      # , groupId: group_id
      # phoneNumbers: ["0955666766", "0990242289"],
      post "message/sms", { from: "ARTOFLIVING", text: text, groupId: 8933698}
    end

    def send_campaign(text, id=440728)
      post "message/#{id}/send", { fromName: "ARTOFLIVING", groupId: 8933698, email: false}
    end

    def emails
      get "messages/email"
    end
  end
end
