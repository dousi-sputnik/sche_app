class UsersController < ApplicationController
  def index
    @users = User.all
    @user_count = User.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :startday, :endday, :allday, :memo))
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :users
    else
      render "new", status: :unprocessable_entity
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :startday, :endday, :allday, :memo))
      flash[:notice] = "「ID:#{@user.id} タイトル:#{@user.title}」の情報を更新しました"
      
      redirect_to :users
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users
  end
end
