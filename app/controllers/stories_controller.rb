class StoriesController < ApplicationController
  
  
  def index
    @comp = Comp.find(params[:comp_id])
    @stories = @comp.stories
  end

  
  def show
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.find(params[:id])
   
    render :show
   # comp_story GET    /comps/:comp_id/stories/:id(.:format)      stories#show

    
  end

def new
  @comp = Comp.find(params[:comp_id])
  @story = @comp.stories.build(story_params)
  
end
   
  def edit
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.find(params[:id])
   # <%= link_to 'Edit', edit_comp_story_path(@story) %> 
  end
    
  def create
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.create(story_params)
    if @story.save
    flash.now[:success] = "Story entry created"
    redirect_to comps_path(@comp)
    
    else
      render :new
    end
  end

  

 
  def update
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.find(params[:id])
   if @story.update_attributes(story_params)
    flash.now[:success] = "Story updated"
 
    redirect_to([@story.comp, @story])
    else
   render 'edit'
    end
  end

  
  def destroy
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.find(params[:id])
    @story.destroy
   redirect_to comp_stories_url
    
  end
  
 def upvote
  @comp = Comp.find(params[:comp_id])
  @story = @comp.stories.find(params[:id])
  @story.votes.create
  flash.now[:notice] = 'add a vote'
  redirect_to comp_path(@comp)
end

 #upvote_comp_story POST   /comps/:comp_id/stories/:id/upvote(.:format) stories#upvote
 #down_comp_story POST   /comps/:comp_id/stories/:id/down(.:format)   stories#down

 
 
 
 
 
def down
  @comp = Comp.find(params[:comp_id])
  @story = @comp.stories.find(params[:id])
  t = @story.my_downvote
  flash.now[:notice] = 'subtract a vote'
  redirect_to comp_path(@comp)
end

  private
   
  def set_story
    @comp = Comp.find(params[:comp_id])
    @story = @comp.stories.find(params[:id])
      
  end

    
    def story_params
      params.require(:story).permit(:title, :text).merge(user_id: current_user.id)
    end
end
