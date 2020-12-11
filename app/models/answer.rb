class Answer < ApplicationRecord

    belongs_to :question

    def gravatar
        "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
    end

end
