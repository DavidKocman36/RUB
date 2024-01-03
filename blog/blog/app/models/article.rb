class Article < ApplicationRecord    
    validates :title, presence: true, uniqueness: true
    validates :prenex, presence: true, length: { minimum: 10, maximum: 200 }
    validates :body, presence: true, length: { minimum: 10 }

    has_many :comments, dependent: :destroy
end
