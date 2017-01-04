class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end


# После создания модели все тесты провалились
# т к в файле test/fixtures/relationships.yml
# были объекты с flwer_id = flwed_id = 1
# Решение: очистить этот файл. (#empty)