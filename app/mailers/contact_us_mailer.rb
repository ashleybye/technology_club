class ContactUsMailer < ActionMailer::Base
  default from: "no-reply@southendyoungmakersclub.co.uk"
  default to: "no-reply@southendyoungmakersclub.co.uk"

  def contact_us_query(message)
  	@user = message.name
  	@email = message.email
  	@comment = message.comment
  	mail(to: 'contact-symc@emd-research.co.uk', from: @email, subject: 'SYMC Query')
  end
end
