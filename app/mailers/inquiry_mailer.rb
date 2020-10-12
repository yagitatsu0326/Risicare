class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
		@inquiry = inquiry
		mail(
			from: 'system@example.com',
			to: ENV['TOMAIL'],
			subject: 'RisicareHP お問い合わせ'
		)
	end

end
