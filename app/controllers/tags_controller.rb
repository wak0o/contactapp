class TagsController < ApplicationController

  def create
    @contact = Contact.find(params[:contact_id])
    @tag = @contact.tags.new(tag_params)

    if @tag.save
      redirect_to contact_path(@contact)
    else
      render 'contacts/show'
    end
  end

  def destroy
    tag = Tag.find(params[:contact_id])
    tag.destroy
    redirect_to contact_path(tag.contact)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
