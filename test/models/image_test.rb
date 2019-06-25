require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'image valid' do
    image = Image.new(url: 'https://media.glassdoor.com/employerbenefits/o/225531/appfolio-employerbenefits-1429212670338.jpg')

    assert_predicate image, :valid?
  end

  test 'image invalid if blank' do
    image = Image.new(url: '')

    assert_not_predicate image, :valid?
    assert_equal "can't be blank", image.errors.messages[:url].first
  end

  test 'image invalid if not proper image extension' do
    image = Image.new(url: 'https://media.glassdoor.com/employerbenefits/o')

    assert_not_predicate image, :valid?
    assert_equal 'is invalid', image.errors.messages[:url].first
  end

  test 'image invalid if not proper uri' do
    image = Image.new(url: 'asdklfjaskldf')

    assert_not_predicate image, :valid?
    assert_equal 'must be a valid url', image.errors.messages[:url].first
  end
end
