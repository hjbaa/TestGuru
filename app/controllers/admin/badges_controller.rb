# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[destroy edit update]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:success] = 'Badge was created!'
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    flash[:success] = 'Badge was destroyed!'
    redirect_to admin_badges_path
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      flash[:success] = 'Badge was updated!'
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description, :image, :rule, :option)
  end
end
