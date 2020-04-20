class RelationshipsController < ApplicationController
    def create
        user= User.find(params[:user_id])
        relationship = Relationship.new(user_id: user.id)
        relationship.follow_id = current_user.id
        relationship.save
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        user= User.find(params[:user_id])
        relationship = Relationship.find_by(user_id: user.id)
        relationship.follow_id = current_user.id
        relationship.destroy
        redirect_back(fallback_location: root_path)
      end

end