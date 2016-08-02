require 'test_helper'

class Admin::Dashboard::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_dashboard_post = admin_dashboard_posts(:one)
  end

  test "should get index" do
    get admin_dashboard_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_dashboard_post_url
    assert_response :success
  end

  test "should create admin_dashboard_post" do
    assert_difference('Admin::Dashboard::Post.count') do
      post admin_dashboard_posts_url, params: { admin_dashboard_post: {  } }
    end

    assert_redirected_to admin_dashboard_post_url(Admin::Dashboard::Post.last)
  end

  test "should show admin_dashboard_post" do
    get admin_dashboard_post_url(@admin_dashboard_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_dashboard_post_url(@admin_dashboard_post)
    assert_response :success
  end

  test "should update admin_dashboard_post" do
    patch admin_dashboard_post_url(@admin_dashboard_post), params: { admin_dashboard_post: {  } }
    assert_redirected_to admin_dashboard_post_url(@admin_dashboard_post)
  end

  test "should destroy admin_dashboard_post" do
    assert_difference('Admin::Dashboard::Post.count', -1) do
      delete admin_dashboard_post_url(@admin_dashboard_post)
    end

    assert_redirected_to admin_dashboard_posts_url
  end
end
