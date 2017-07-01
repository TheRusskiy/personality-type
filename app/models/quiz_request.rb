class QuizRequest < ApplicationRecord
  belongs_to :user

  def in_json
    {
      id: id,
    }
  end
end
