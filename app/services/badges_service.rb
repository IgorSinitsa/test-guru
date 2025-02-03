class BadgesService
  HASH_BADGES_SERVICE = { "0": [I18n.t("badge.service.attemps"), "pass_test_attemps_one"],
                          "1": [I18n.t("badge.service.level"), "pass_test_level"],
                          "2": [I18n.t("badge.service.category"), "pass_test_category"] }

  def initialize(result, key = nil)
    @badges_service = HASH_BADGES_SERVICE
    @user = result.user
    @test = result.test
    @attempts = result.attempts
    @badges = []
  end

  def self.list_service
    HASH_BADGES_SERVICE.to_h { |key, value| [value[0], key] }
  end

  def give
    jobs_badges(list_jobs_badges) if list_jobs_badges.present?
  end

  private

  def to_key(str)
    str.to_s.to_sym.downcase
  end

  def list_jobs_badges
    Badge.code_jobs
  end

  def jobs_badges(jobs)
    jobs.each { |job| @user.badges << @badges if chanch_service(to_key(job)) }
  end

  def chanch_service(key)
    @badges = send((@badges_service[key])[1])
    @badges.present?
  end

  #  сервисы -----------
  def test_service
    Badge.for_code("0") if true
  end

  def pass_test_attemps_one
    Badge.for_code("0") if @attempts == 0
  end

  def pass_test_level
    Badge.for_code("1").for_text(@test.level.to_str) if @user.pass_test_level(@test.level).size == Test.level(@test.level).size
  end

  def pass_test_category
    Badge.for_code("2").for_text(@test.category.title) if @user.pass_test_category(@test.category.title).size == Test.category_of(@test.category.title).size
  end
end
