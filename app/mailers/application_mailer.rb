class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru Project" <test-guru@mail-cml.ru>}
  layout "mailer"
end
