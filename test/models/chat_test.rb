require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  test "Chat::recent" do
    # returns a non-empty array
    refute_empty Chat.recent

    # doesn't have deleted chats
    refute_includes Chat.recent, chats(:bad_chat)
  end
end
