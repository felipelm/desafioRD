class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_filter :find_custom_fields

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(user_id: current_user.id)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    custom_field_values = create_custom_field_values
    @contact.custom_field_values = custom_field_values

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        @contact.custom_field_values.destroy_all
        format.html { render :new, custom_fields: custom_field_values }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        update_custom_field_values
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_custom_fields
        @custom_fields = CustomField.where(user_id: current_user.id)
    end

    def update_custom_field_values
      if !params[:cf].nil? && !params[:cf].empty?
        params.require(:cf).each do |cf|
          new_cf_value = find_or_create_custom_field_value(cf)
          new_cf_value.value = cf.second
          new_cf_value.save
        end
      end
    end

    def find_or_create_custom_field_value(cf)
      cfv = @contact.custom_field_values.find_by_custom_field_id(cf.first)
      if cfv.nil?
        CustomFieldValue.create(contact_id: @contact.id,custom_field_id: cf.first, value: cf.second)
      else
        cfv
      end
    end

    def create_custom_field_values
      custom_fields = []
      if !params[:cf].nil? && !params[:cf].empty?
        params.require(:cf).each do |cf|
          custom_fields << CustomFieldValue.create(custom_field_id: cf.first, value: cf.second)
        end
      end
      custom_fields
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email).merge(user_id: current_user.id)
    end
end
