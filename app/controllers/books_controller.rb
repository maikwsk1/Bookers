class BooksController < ApplicationController
  
  def start
    # Your start action logic here
  end
  
  def new
    @book = Book.new  
  end
  
  def create
    book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if book.save
    flash[:notice] = "投稿が成功しました"
    redirect_to book_path(book.id)
    else
     render :new
    end
  end
  
  def index
    @books = Book.all  
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "投稿が成功しました"
    redirect_to book_path(book.id)  
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
