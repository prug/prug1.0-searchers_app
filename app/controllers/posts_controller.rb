class PostsController < ApplicationController
 
  def index     
    @search = Sunspot.search(Post) do
      keywords(params[:keywords]) if params[:keywords]
      
      tmp = with(:category_ids).any_of(params[:category_ids]) if params[:category_ids].present? #tu był wielki bug ale go naprawiłem
      facet(:category_ids, :exclude => tmp)
    end
    
    @posts = @search.results
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
end
