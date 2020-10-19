class Sub < ApplicationRecord

    validates :title, :moderator_id, presence: true 

    belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User,
    primary_key: :id 

    has_many :post_subs,
    class_name: :PostSub,
    foreign_key: :sub_id 

    has_many :posts,
    through: :post_subs,
    source: :post

    
   


end


