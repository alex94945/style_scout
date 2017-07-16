class ApplicationMailer < ActionMailer::Base
  default from: "alex94945@gmail.com"

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['API_KEY']
    message_params = {:from    => ENV['GMAIL_USERNAME'],
                      :to      => ENV['GMAIL_USERNAME'],
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['domain'], message_params
  end

  layout 'mailer'
end
