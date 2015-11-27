module UserItemVotesHelper
  def link_to_upvote(object)
    link_to 'like!', vote_item_path(object), method: :post, class: 'text-danger'
  end

  def link_to_downvote(object)
    link_to 'unlike!', vote_item_path(object), method: :delete, class: 'text-muted'
  end

#case 1: none pressed before, can up or down
#case 2: up before, cannot up again ("upvoted")
#case 3: down before, cannt down again ("downvoted")
#case 4: up before, down -> back to normal, case 1
#case 5: down before, up -> back to normal, case 1

  # def render_votes_for_item(item=nil)
  #   if current_user && @votes[item.id].include?(current_user.id)
  #     link_to_downvote(item)
  #   else
  #     link_to_upvote(item)
  #   end
  # end


  def render_link_to_user(user, options={})
    if user.disabled?
      user.username
    else
      link_to user.username, user, options
    end
  end
end
