class UserPreference < ActiveRecord::Base
  serialize :cuisine_preference, Array
end
