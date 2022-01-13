class GistsController < ApplicationController
  def create
    find_test_passage

    result = GistQuestionService.new(@test_passage.current_question).call

    if result.html_url.present?
      link = result.html_url
      Gist.create(question: @test_passage.current_question, creator: current_user, url: link)

      flash[:notice] = I18n.t('gist.create.success_html', link: link)
    else
      flash[:danger] = 'Gist was not created!'
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
