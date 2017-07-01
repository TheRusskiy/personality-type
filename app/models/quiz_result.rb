class QuizResult < ApplicationRecord
  belongs_to :user

  def in_json
    {
      id: id,
      personality_type: personality_type,
    }
  end
end
