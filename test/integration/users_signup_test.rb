require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                  email: "user@invalid",
                                  password:              "foo",
                                  password_confirmation: "bar" } }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
    assert_select 'div.alert-danger'
    #assert_select ’form[action="/signup"]’
  end



  test "successful signup" do
    get signup_path
    assert_difference 'User.count',1 do
       post signup_path, params: { user: { name:  "James",
                                           email: "user@valid.com",
                                           password:              "123456",
                                           password_confirmation: "123456" } }
    end
    follow_redirect!
    #assert_template 'users/show'
    #assert is_logged_in?

    #assert_select 'div.alert'
    #assert_select 'div.alert-success'
    assert_not flash.empty?
    #assert_equal flash[:success], "Welcome to the Sample App!"
  end

end