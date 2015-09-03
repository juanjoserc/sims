require 'test_helper'

class TicketMailerTest < ActionMailer::TestCase
  test "new_note" do
    mail = TicketMailer.new_note
    assert_equal "New note", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
