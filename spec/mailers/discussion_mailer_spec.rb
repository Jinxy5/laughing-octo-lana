require "spec_helper"

describe DiscussionMailer do
  describe "new_reply_notification" do
    let(:mail) { DiscussionMailer.new_reply_notification }

    it "renders the headers" do
      mail.subject.should eq("New reply notification")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
