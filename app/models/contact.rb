class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :message, validate: true
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "Tu as reçu un message de #{name} - Les Jardins d'Alice",
      to: "lesjardinsdalice@outlook.fr",
      from: "#{name} - <#{email}>"
    }
  end

end
