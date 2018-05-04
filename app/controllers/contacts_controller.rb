class ContactsController < ApplicationController

  def index
    @limit = params[:contact_per_page].to_i
    offset = params[:offset].to_i * @limit ||= 0
    @contacts = Contact.all.offset(offset).order('created_at DESC').limit(@limit)
  end

  def show
    @contact = Contact.find(params[:id])
    @tag = Tag.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path(contact_per_page: 10)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end
end
