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
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end
  def show
  end

  def update
    if @contact.update(contact_params)
      flash[:notice] = 'Contact was updated successfully'
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    flash[:notice] = 'Contact was deleted successfully.'
    redirect_to contact_path(@contact)

  end

  private
  def find_contact
      @contact = Contact.find(params[:id])
  end
  def contact_params
    params.require(:contact).permit(:name,:email,:phone_number,:address)
  end
end
