class Page < ApplicationRecord
  before_action :authenticate_user!
end
