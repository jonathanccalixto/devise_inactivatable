class User < ActiveRecord::Base
  devise :database_authenticatable, :inactivatable
end
