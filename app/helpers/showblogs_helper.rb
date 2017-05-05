module ShowblogsHelper
  
  def vote_spec(showblog)
  result = ''
  showblog.showruns.group(:spec_vote).count.each do |spec,count|
    result << "Spec: #{spec}  Votes: #{count} <br/>"
    # or the other logic you want to add such as using a table or div
  end
  result.html_safe
end
#default_scope { order ('event') }
def sorted_runs(showrun)
  showblog.showruns.order(:event)
  
end


def past_show(showblog)


showblog.where(:rundate => ' < Time.now - 480.minutes' )
@showblog.destroy
redirect_to showblogs_url

end
  
  
end
