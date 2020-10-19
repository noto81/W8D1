class SubsController < ApplicationController
    before_action :require_login!, only: [:create, :edit, :show]
    def new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
        else
            flash[:errors] = @sub.errors.full_messages
        end
            redirect_to user_url(current_user.id)
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub.id)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def index
        @subs = Sub.all 
        render :index
    end

    def sub_params
        params.require(:sub).permit(:title, :desciption)
    end
end
