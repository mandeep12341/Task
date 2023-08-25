class Blog < ApplicationRecord
    has_one_attached :avatar
    belongs_to :user
    attribute :body, :text
    has_many :comments ,dependent: :destroy, inverse_of: :blog
    accepts_nested_attributes_for :comments ,allow_destroy: true ,reject_if: :all_blank
end
