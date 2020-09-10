class Contact < MailForm::Base
    attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message

    def headers
        {
        :subject => "Contact Inquiry",
        :to => "lzm0010@gmail.com",
        :from => %(<#{email}>)
        }
    end
end
