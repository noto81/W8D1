class Post < ApplicationRecord

    validates :title, :author_id, presence: true

    belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

    has_many :post_subs,
    class_name: :PostSub,
    foreign_key: :post_id 

    has_many :subs,
    through: :post_subs,
    source: :sub


    

end
