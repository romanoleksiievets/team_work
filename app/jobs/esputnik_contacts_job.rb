# class EsputnikContactsJob < ApplicationJob
#   queue_as :default

#   def perform(organization)
#     int = organization.esputnik.new
#     int.contacts.each do |contact|
#       EsputnikContact.create(contact)
#     end
#   end
# end

# EsputnikContactsJob.perform_at(Time.now.midnight, Organization.find(3))
