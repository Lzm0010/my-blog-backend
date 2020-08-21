class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]

    def create
        post = Post.new(post_params)
        if @post.save
          render json: post
        else
          render json: {"error": "Your post wasn't created Lee, you made an uh oh!"}
        end
    end
    

    def index
        posts = Post.all #include sort here later
        render json: posts.to_json(:include => {
            :comments => {:only => [:id, :user_id, :author, :content, :created_at, :updated_at]}
        })
    end

    def show
        render json: post
    end

    def update
        if post.update(post_params)
            render json: post.to_json(:include => {
                :comments => {:only => [:id, :user_id, :author, :content, :created_at, :updated_at]}
            })

        else 
            render json: {"error": "Your post wasn't updated Lee, you made an uh oh!"}
        end
    end

    def destroy
        if post.destroy
            render json: post
        else
            render json: {"error": "Your post wasn't deleted Lee, you made an uh oh!"}
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :cover_photo_url, :content, :views, :likes, :user_id)
    end

    def set_post
        post = Post.find(params[:id])
    end

    
end
