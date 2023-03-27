require 'slack-notifier'

class SlackNotifier
  def self.send_message(message)
    notifier = Slack::Notifier.new ENV['SLACK_WEBHOOK_URL']
    notifier.ping message
  end
end
