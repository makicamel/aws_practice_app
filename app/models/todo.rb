# frozen_string_literal: true

class Todo < ApplicationRecord
  mount_uploader :image, ::TodoUploader
end
