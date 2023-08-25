class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  
  def index  
    @blog =Blog.all
  end

  def new
    @blog = Blog.new
    @blog.comments.build
  end

  def update
    @blog = Blog.find(params[:id])
    authorize! :update, @blog
    if @blog.update(blog_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @id = @blog.id
    authorize! :read, @blog
   
  end

   




  def destroy 
    @blog = Blog.find(params[:id])
    authorize! :destroy, @blog
    if @blog.destroy
      
    else
      render :edit, status: :unprocessable_entity
    end
  rescue CanCan::AccessDenied
    flash[:alert] = "You are not authorized to access this page."
    redirect_to root_path
  end

  


  def create
    @blog = current_user.blogs.build(blog_params)
    @blog.user_id = current_user.id # Assign the current user's ID
    if @blog.save
      redirect_to root_path
     
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit 
    
    @blog = Blog.find(params[:id] )
    authorize! :update, @blog
  rescue CanCan::AccessDenied
    flash[:alert] = "You are not authorized to access this page."
    redirect_to root_path

  end
  
  private

  def blog_params
    params.require(:blog).permit(:title, :description  , :avatar , comments_attributes: %i[id, paragraph ,_destroy])
  end
  
  
end
