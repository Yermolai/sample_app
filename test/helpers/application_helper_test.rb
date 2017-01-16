require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Tornado App"
    assert_equal full_title("Help"), "Help | Tornado App"
  end
end