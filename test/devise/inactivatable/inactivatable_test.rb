require "test_helper"

class InactivatableTest < ActiveSupport::TestCase
  include Support::Assertions
  include Support::Factories
  include Support::Swappers

  def encrypt_password(admin, pepper=Admin.pepper, stretches=Admin.stretches, encryptor=Admin.encryptor_class)
    encryptor.digest('123456', stretches, admin.password_salt, pepper)
  end

  test '#inactivated_at should be nil when admin created' do
    assert_nil create_admin.inactivated_at
  end

  test '#inactivate! should set #inactivated_at' do
    admin = create_admin
    assert_not admin.inactivated_at.present?
    admin.inactivate!
    assert admin.inactivated_at.present?
  end

  test '#activate! should set #inactivated_at with nil' do
    admin = create_admin(:inactivated_at, Time.now)
    assert admin.inactivated_at.present?
    admin.inactivate!
    assert_not admin.inactivated_at.present?
  end

  test '#active? should be true when actived' do
    admin = create_admin(:inactivated_at, Time.now)
    assert_not admin.active?
    admin.activate!
    assert admin.active?
  end

  test '#inactive? should be true when inactived' do
    admin = create_admin
    assert_not admin.inactive?
    admin.inactivate!
    assert admin.inactive?
  end
end
