class TodolistsController < ApplicationController
  def new
  	  #Viewに渡すためのインスタント変数に空のモデルオブジェクトを生成する
  	  @list = List.new
  end

  # 以下を追加
  def create
  	# ストロングパラメーターを使用
  	 list = List.new(list_params)
  	# DBへ保存する
     list.save
    # 詳細画面へリダイレクト
     redirect_to todolist_path(list.id)
  end

  def index
      @lists = List.all  	
  end
  
  def show
    @list = List.find(params[:id])	
  end
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)	
  end
  def destroy
    list = List.find(params[:id]) #データ(レコード)を１件取得
    list.destroy #データデータ(レコード)を削除
    redirect_to todolists_path #List一覧画面にリダイレクト
  end

  private

  def list_params
  	params.require(:list).permit(:title, :body, :image)  	
  end

end
