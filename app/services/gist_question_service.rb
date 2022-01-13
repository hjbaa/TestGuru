GistResponse = Struct.new(:success?, :html_url)

class GistQuestionService
  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    GistResponse.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      description: I18n.t('gist_question_service.gist_params.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(access_token: Rails.application.credentials.github_access_token)
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:content)].join("\n")
  end
end
