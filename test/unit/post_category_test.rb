require 'test_helper'

class PostCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PostCategory.new.valid?
  end
end
