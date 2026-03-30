class PrototypesController < ApplicationController
  
before_action :authenticate_user!, except: [:index, :show] ##ログイン済みの人のみ見れるようにしています
before_action :move_to_index, only: [:edit, :update, :destroy] ##これしないとログインしていれば他のidの人の情報が削除できてしまう
  

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC") ##Pictweetで行っていた投稿を新しい順にするやつ
  end


  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])##move_to_indexで同じ処理しているから、削除するべき
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit 
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id ##プロトタイプとログインユーザーが同じか確認
      redirect_to action: :index
    end
  end
end

