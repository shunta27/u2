require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  if Rails.env.production?
    config.add_notifier :slack, {
      :webhook_url => ENV['SLACK_WEBHOOK_URL'],
      :channel => "##{ENV['SLACK_CHANNEL_NAME']}"
    }
  end
end
