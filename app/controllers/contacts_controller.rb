class ContactsController < ApplicationController
  before_action :find_contact, only:[:destroy,:show,:update,:edit]
  def index
    @contacts = Contact.all.order :id
  end
  def new
    @contact = Contact.new
  end
  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Contact was created successfully.'
      redirect_to contacts_path
    else
      render 'new'
    end
  end
  def show
  end

  def update
    old_contact_attributes = @contact.attributes

    if @contact.update(contact_params)
      if @contact.attributes != old_contact_attributes
        flash[:notice] = 'Contact was updated successfully'
      else
        flash[:notice] = 'No changes were made.'
      end
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = 'Contact was deleted successfully.'
    redirect_to contacts_path

  end

  private
  def find_contact
      @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:name,:email,:phone_number,:address)
  end
end
