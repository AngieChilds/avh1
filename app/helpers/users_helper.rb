module UsersHelper
#def status_label status
 # status_span_genrator status
#end

#private
 # def status_span_generator status
  # case status
   #when 'user.status.admin?'
   #content_tag(:span, status.titleize, class: 'alert alert-danger') 
   #when 'user.status.moderator?'
   #content_tag(:span, status.titleize, class: 'alert alert-success') 
   #when 'user.status.trusty?'
  # content_tag(:span, status.titleize, class: 'alert alert-info') 
   #when 'user.status.beginner?'
   #content_tag(:span, status.titleize, class: 'alert alert-warning') 
  # end 
  
 # end
  
  def admin
    return true if (status).inspect == 'admin'
  end
  
  
  
end

  

