require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create' do
    User.create!(
      name: 'Tester',
      email: 'tester@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
  end

  test 'validation' do
    user = User.new(
      name: 'Tester',
      email: 'tester@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
    assert user.valid?

    user = User.new(
      name: 'Tester',
      email: 'one@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
    assert_not user.valid?

    user = User.new(
      name: 'Tester',
      email: 'tester@example.com',
      password: 'secret',
      password_confirmation: 's'
    )
    assert_not user.valid?

    user = User.new(
      name: '',
      email: 'tester@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
    assert_not user.valid?
  end

  test 'authenticate' do
    user = User.new(
      name: 'Tester',
      email: 'tester@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
    assert user.authenticate('secret')
    assert_not user.authenticate('xxxx')
  end
end
