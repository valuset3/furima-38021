class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :image, :name, :description, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
end
