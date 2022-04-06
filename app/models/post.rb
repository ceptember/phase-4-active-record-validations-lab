class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    validate :title_is_clickbait 

    def title_is_clickbait
       phrases = ["Won't Believe", "Secret", "Top #{/[0-9]/}","Guess"]
        phrases_in_title = phrases.filter { |phrase| title&.include?(phrase) } 
        
        unless phrases_in_title.length > 0
            errors.add(:title, "Not clickbait-y enough")
        end
    end
end

