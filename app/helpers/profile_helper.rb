module ProfileHelper
  def like_form_options(answer)
    if answer.liked_by?(current_user)
      method = :delete
      like = answer.like_from(current_user)
      button_class = 'btn-like-red'
    else
      method = :post
      like = Like.new
      button_class = 'btn-like-gray'
    end

    { like: like, answer: answer, method_form: method, button_class: button_class }
  end
end
