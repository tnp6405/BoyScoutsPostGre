class Run < ActiveRecord::Base
  belongs_to :route
  belongs_to :member
end
