class Admin::MembersController < Admin::ApplicationController

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    flash[:notice] = '会員情報を編集しました'
    # 編集後は会員詳細画面へ遷移
    redirect_to admin_member_path
  end

  private

  #会員ステータス編集時、選択するための設定
  def member_params
    params.require(:member).permit(:is_deleted)
  end

end
