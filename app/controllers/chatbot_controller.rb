class ChatbotController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        access_token = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0Njk4MCwidGltZXN0YW1wIjoiMjAxOS0wNC0yMiAwNzo1NzozNiArMDAwMCJ9.Kuh3MI4fPjhdYETmAiRuX1QIG9UzH6-6irHpTBe3FnY'
        message = params[:message][:text]
        topic_id = params[:chat_room][:qiscus_room_id]
        if !message.nil?
          message = message.split(' ').join('%2B')
        else
          message = "kami%20tidak%tahu"
        end
        text = "hasil%20pencarian%20google:%20https://www.google.com/search?q=#{message}"
          require 'json'
          %x{curl -X POST \
          'https://qisme.qiscus.com/api/v1/chat/conversations/post_comment?access_token=#{access_token}&topic_id=#{topic_id}&comment=#{text}&type=&payload=' \
          -H 'Postman-Token: ecdfc8c0-7087-4f8f-bda0-c59fa6d3245f' \
          -H 'cache-control: no-cache'}
    end

    def index
    end
end
