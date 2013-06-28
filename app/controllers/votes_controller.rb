class VotesController < ApplicationController


  def create
    vote = Vote.find_or_create_by_user_id_and_voteable_id_and_voteable_type(voteable_type: params[:voteable_type],
                voteable_id: params[:voteable_id],
                user_id: current_user.id)
    vote.update_attributes(value: params[:value])

    post = params[:voteable_type].classify.constantize.find(params[:voteable_id])
    p vote
    p params
    p "POST #{post}"
    p "POST votes #{post.sum_votes}"

    vote.save
    p "controller @@@@@@@@@@@@@@@"
    p post.sum_votes
    render :json => post.sum_votes.to_json
  end
end
