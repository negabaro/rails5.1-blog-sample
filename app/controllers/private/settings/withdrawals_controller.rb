class Private::Settings::WithdrawalsController < ApplicationController
  def edit

  end

  def destroy
    current_user.destroy
    redirect_to root_path, notice: '退会しました'
    #TODO: 退会したユーザーが投稿したデータはまだそのままのこっていてそこのuser_nickname情報がなくエラーになりました。
  end
end
