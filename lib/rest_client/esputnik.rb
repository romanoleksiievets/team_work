module RestClient
  class Esputnik < BasicAuth
    def handshake
      get "version"
    end

    def groups
      get "groups"
    end

    def group_contacts(group_id)
      get "group/#{group_id}/contacts"
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

    def send_campaign(text, email = true)
      # фраза дня = 463477
      id = 463477
      post "message/#{id}/send", { fromName: "ARTOFLIVING", groupId: 8933698, email: email, params: [{key: "body", value: text}] }
    end

    def emails
      get "messages/email"
    end


    #TODO: rewrite this hardcoded methods to use data from db
    def email_groups
      self.groups.select {|g| g["name"] == "Емейл розсилка"}
    end

    def sms_groups
      self.groups.reject {|g| ["Для тестування", "Емейл розсилка", "Все контакты",].include? g["name"]}
    end

    def blessing_group
      self.groups.select {|g| g["name"] == "Блессеры"}
    end

    def testing_group
      self.groups.select {|g| g["name"] == "Для тестування"}
    end

  end
end
