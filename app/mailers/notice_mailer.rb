class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    # @greeting = "Hi"
    @blog = blog

    mail to: "alexandritecr@gmail.com",
         subject: '【Achieve】ブログが投稿されました'
  end

  def sendmail_contact(contact)
    # @greeting = "Hi"
    @contact = contact

    mail to: @contact.email,
         subject: '【Achieve】お問い合わせを受け付けました'
  end
end