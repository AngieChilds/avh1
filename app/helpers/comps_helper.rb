module CompsHelper
   def sorted_job(job)
     comp.jobs.order(:amount)
       
   end
   
  def owner
    owner_id = user_id
    
  end
end
