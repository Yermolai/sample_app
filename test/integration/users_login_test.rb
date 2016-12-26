require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

test "login with invalid information" do
  get login_path                  #1. Visit the login path.
  assert_template 'sessions/new'  #2. Verify that the new sessions form renders properly.
  post login_path, params: { session: { email: "", password: "" } } #3. Post to the sessions path with an invalid params hash.
  assert_template 'sessions/new'  #4. Verify that the new sessions form gets re-rendered
  assert_not flash.empty?             #and that a flash message appears.
  get root_path                   #5. Visit another page (such as the Home page).
  assert flash.empty?             #6. Verify that the flash message doesn’t appear on the new page.
end

  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
        password: 'password' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)



    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end




end
