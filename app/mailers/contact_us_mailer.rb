class ContactUsMailer < ActionMailer::Base
  default from: "no-reply@southendyoungmakersclub.co.uk"
  default to: "no-reply@southendyoungmakersclub.co.uk"

  def contact_us_query(message)
  	@user = message.name
  	@email = message.email
  	@comment = message.comment
  	mail(to: 'contact-symc@emd-research.co.uk', from: @email, subject: 'SYMC Query')
  end

  def interested_party_message(message)
    @parent = "#{message.parent_title.humanize} #{message.parent_firstname} #{message.parent_lastname}"
    @relationship = message.parent_relationship
    @child = "#{message.child_firstname} #{message.child_lastname unless message.child_lastname == message.parent_lastname}"
    @dob = Date.parse(message.child_dob).strftime('%d %B %Y')
    @age = age(Date.parse(@dob))
    @gender = message.child_gender
    @session_time = message.session_time
    @email = message.parent_email
    @comments = message.comments
    mail(to: 'interest-symc@emd-research.co.uk', from: @email, subject: "#{@child} (#{@age}) is interested")
  end

  def volunteer(message)
    @firstname = message.firstname
    @lastname = message.lastname
    @email = message.email
    @phone_no = message.phone_no
    @why = message.why
    @experience = message.experience
    @comments = message.comments
    mail(to: 'volunteers-symc@emd-research.co.uk', from: @email, subjet: "I'd like to volunteer")
  end

  private

    def age(date)
      age = Date.today.year - date.year
      age - 1 if (Date.today.month <= date.month) && (Date.today.day < date.day)
      age
    end
end
