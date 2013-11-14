# -*- coding: utf-8 -*-

require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test 'email from contact us' do
    assert_difference 'ActionMailer::Base.deliveries.size' do
      @text  = 'Lorem ipsum dolor'
      @email = Notifications
        .contact_us_mail('paul@example.com', @text).deliver
    end

    assert_equal ['everton.carpes@gmail.com'], @email.to
    assert_equal ['contact@acidit.com'      ], @email.from
    assert_equal ['paul@example.com'        ], @email.reply_to

    expected_subject =
      '[AcidIT][Contact] New message from paul@example.com'
    assert_equal expected_subject, @email.subject

    expected_body = []
    expected_body << '<paul@example.com>'
    expected_body << ''
    expected_body << 'sent a message through the "Contact Us" form.'
    expected_body << 'the message was:'
    expected_body << ''
    expected_body << '  "Lorem ipsum dolor"'
    expected_body << ''

    assert_equal expected_body.join("\n"), @email.body.to_s
  end
end
