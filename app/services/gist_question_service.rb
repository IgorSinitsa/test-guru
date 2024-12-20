class GistQuestionService
  ACCESS_TOKEN = ENV["GITHUB_TOKEN"]

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def send_gist
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      "description": I18n.t("text.description", test: @test.title),
      "public": false,
      "files": {
        "#{@question.id}_text_question.txt": {
          "content": gist_content,
        },
      },
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
