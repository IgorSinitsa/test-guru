module ApplicationHelper
  def flash_message(flash)
    if flash.present?
      result_boby = []
      flash.each do |key, message|
        result_boby.push(raw(content_tag :p, message, class: "flash #{key}"))
      end
      safe_join(result_boby)
    end
  end

  def github_url(user:, repo: "")
    result_body = if repo.blank?
        user
      else
        repo.split(/[-_]/).map(&:capitalize).join
      end

    link_to result_body,
            "https://github.com/#{user}/#{repo}",
            target: :"_blank",
            rel: :"noopener noreferrer nofollow"
  end

  def thinknetica
    link_to "  реализован благодаря онлайн-школе Thinknetica
    ",
            "https://thinknetica.com/", target: :"_blank",
                                        rel: :"noopener noreferrer nofollow"
  end

  def current_year
    Date.today.year
  end
end
