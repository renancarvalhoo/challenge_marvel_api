require "test_helper"

class UpvoteHelperTest < ActionView::TestCase
  test 'is favorite' do
    assert favorite?(1, [1, 2, 3])
  end

  test 'is not favorite' do
    assert !favorite?(4, [1, 2, 3])
  end
end