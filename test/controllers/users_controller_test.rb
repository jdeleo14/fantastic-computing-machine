require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret' } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

#...
def create
@user = User.new(user_params)
respond_to do |format|
  if @user.save
    format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
    format.json { render :show, status: :created, location: @user }
  else
    format.html { render :new }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  end
 end
end
#...

#...
def update
 respond_to do |format|
  if @user.update(user_params)
    format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
    format.json { render :show, status: :ok, location: @user }
  else
    format.html { render :edit }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  end
 end
end
#...

#...
def index
    @users = User.order(:name)
end
#...