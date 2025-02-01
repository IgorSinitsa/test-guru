class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, flash: { success: "Badge was succesfuly create" }
    else
      render :new
    end
  end

  def destroy
    redirect_to admin_badges_path, alert: "Badge was succesfuly delete" if @badge.destroy
  end
end

private

def set_badge
  @badge = Badge.find(params[:id])
end

def badge_params
  params.require(:badge).permit(:name, :img, :code)
end
