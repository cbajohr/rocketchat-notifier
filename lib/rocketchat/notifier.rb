require "rocketchat/notifier/version"
require "httparty"

module RocketChatNotifier
  class << self
    attr_accessor :webhook_url, :verbose_mode

    def configure
      yield self

      raise "\nrocket chat notifier - configuration error: missing `webhook_url` in initializer" unless webhook_url
    end

    def notify(message, event: '', emoji: '', attachment: [{}])
      Rails.logger.debug("\nintitializing rocket chat notifier ") if verbose_mode == true
      raise "\nrocket chat notifier - error: empty rocket chat message, message text is mandatory" unless message

      Rails.logger.debug("\nparsing options: \n  message: `#{message}`\n  event: `#{event}`\n  emoji: `#{emoji}`\n  attachment: `#{attachment}`") if verbose_mode == true

      request_body = {
        message: message
      }

      request_body[:event] = event if event.present?
      request_body[:emoji] = emoji if emoji.present?
      request_body[:attachment] = attachment if attachment.present?

      begin
        Rails.logger.debug("\nsending rocket chat notification request to webhook url:\n#{webhook_url}") if verbose_mode == true

        response = JSON.parse HTTParty.post(webhook_url, body: request_body.to_json, headers: { 'Content-Type' => 'application/json' }).body

        Rails.logger.debug("\nrocket chat response:\n#{response.inspect}\n") if verbose_mode == true
        warn("\nrocket chat notifier - warning: rocket chat could not be notified. rocket chat response: `#{response['error']}`") unless response['success'] || response['success'] == true
      rescue
        warn("\nrocket chat notifier - warning: could not connect to rocket chat webhook url or parse JSON result, check your webhook_url")
      end

      response
    end
  end
end
