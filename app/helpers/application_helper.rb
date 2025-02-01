module ApplicationHelper
  HASH_CSS_FLASH = { alert: "alert alert-danger",
                     success: "alert alert-success",
                     notice: "alert alert-info" }

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
    link_to "  реализован благодаря онлайн-школе Thinknetica   ",
            "https://thinknetica.com/", target: :"_blank",
                                        rel: :"noopener noreferrer nofollow"
  end

  def current_year
    Date.today.year
  end

  def css_flash(key)
    HASH_CSS_FLASH[key.to_sym] || "alert alert-dark"
  end

  def class_img(img)
    result_body = "<i class='#{img}' style='font-size: 10rem;' ></i>"
    safe_join([raw(result_body)])
  end
end
