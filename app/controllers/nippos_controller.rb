# frozen_string_literal: true
class NipposController < PrivateController
  def new
    @nippo = Nippo.new(
      body: current_user.template.body,
      reported_for: Nippo.default_report_date,
    )
  end

  def create
    @nippo = Nippo.new(nippo_params)

    if @nippo.save
      NippoSender.new(user: current_user, nippo: @nippo).send
      flash[:notice] = '日報を送信しました'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @nippo = Nippo.find(params[:id])
    reaction = Reaction.find_or_create_by(user: current_user, nippo: @nippo)
    Reaction.increment_counter(:page_view, reaction.id)
  end

  private

  def nippo_params
    params.require(:nippo).permit(:body, :reported_for).merge(
      user: current_user,
      subject: current_user.template.subject,
    )
  end

  def current_report_date
    Time.zone.today
  end
end
