require 'test_helper'

class PostCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PostCategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PostCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PostCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to post_category_url(assigns(:post_category))
  end

  def test_edit
    get :edit, :id => PostCategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    PostCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PostCategory.first
    assert_template 'edit'
  end

  def test_update_valid
    PostCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PostCategory.first
    assert_redirected_to post_category_url(assigns(:post_category))
  end

  def test_destroy
    post_category = PostCategory.first
    delete :destroy, :id => post_category
    assert_redirected_to post_categories_url
    assert !PostCategory.exists?(post_category.id)
  end
end
