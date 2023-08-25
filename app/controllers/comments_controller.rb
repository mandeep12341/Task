class CommentsController < ApplicationController
 
    def get_partial
       
        @data = params[:data]

        puts {@comment}
     
      html_content = render_to_string(partial: 'comment_fields', locals: { f: @comment })
      render html: html_content.html_safe
    end
    
    def destroy

      puts("i am ehere-------->>>>>>>>>>>>_------>>>> --------#{params[:id]}")

      @comment =Comment.find(params[:id])
    end

    def show
      puts("this is id-------->>>>>>>>>>>>_------>>>> --------#{params[:id]}")
      @comment =Comment.find(params[:id])
     if @comment.destroy
      redirect_to request.referrer
     end

    end
   
   
  end
  