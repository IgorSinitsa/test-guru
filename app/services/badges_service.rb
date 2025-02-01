class BadgesService
  HASH_BADGES_SERVICE = { "0": [I18n.t("badge.service.attemps"), "pass_test_attemps_one"],
                          "1": [I18n.t("badge.service.level"), "pass_test_level"],
                          "2": [I18n.t("badge.service.category"), "pass_test_category"] }
  LEVEL = 1
  CATEGORY = "Backend"

  def initialize(result, key = nil)
    @badges_service = HASH_BADGES_SERVICE
    @user = result.user
    @test = result.test
    @point = result.point
    @attempts = result.attempts
    @passed_test = result.passed_test?
    @badges = []
  end

  def self.list_service
    HASH_BADGES_SERVICE.to_h { |key, value| [value[0], key] }
  end

  def give
     if @passed_test
      jobs_badges(list_jobs_badges)
      save
     end
    # @badges
  end

  private

  def save
    @badges.each do |badge_code|
      badge_code.each { |badge| UserBadge.create(user: @user, test: @test, badge: badge) }
    end
  end

  def to_key(str)
    str.to_s.to_sym.downcase
  end

  def list_jobs_badges
    Badge.code_jobs
  end

  def jobs_badges(jobs)
    jobs.each { |job| @badges << Badge.badges_for_code(to_key(job)) if chanch_service(to_key(job)) }
  end

  def chanch_service(key)
    func = @badges_service[key]
    send(func[1])
  end

  #  сервисы -----------
  def test_service
    true
  end

  def pass_test_attemps_one
    @attempts == 1
  end

  def pass_test_level
    @user.pass_test_level(LEVEL).size == Test.level(LEVEL).size
  end

  def pass_test_category
    @user.pass_test_category(CATEGORY).size == Test.category_of(CATEGORY).size
  end
end
