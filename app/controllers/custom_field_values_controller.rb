class CustomFieldValuesController < ApplicationController
  before_action :set_custom_field_value, only: [:show, :edit, :update, :destroy]

  # GET /custom_field_values
  # GET /custom_field_values.json
  def index
    @custom_field_values = CustomFieldValue.all
  end

  # GET /custom_field_values/1
  # GET /custom_field_values/1.json
  def show
  end

  # GET /custom_field_values/new
  def new
    @custom_field_value = CustomFieldValue.new
  end

  # GET /custom_field_values/1/edit
  def edit
  end

  # POST /custom_field_values
  # POST /custom_field_values.json
  def create
    @custom_field_value = CustomFieldValue.new(custom_field_value_params)

    respond_to do |format|
      if @custom_field_value.save
        format.html { redirect_to @custom_field_value, notice: 'Custom field value was successfully created.' }
        format.json { render :show, status: :created, location: @custom_field_value }
      else
        format.html { render :new }
        format.json { render json: @custom_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_field_values/1
  # PATCH/PUT /custom_field_values/1.json
  def update
    respond_to do |format|
      if @custom_field_value.update(custom_field_value_params)
        format.html { redirect_to @custom_field_value, notice: 'Custom field value was successfully updated.' }
        format.json { render :show, status: :ok, location: @custom_field_value }
      else
        format.html { render :edit }
        format.json { render json: @custom_field_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_field_values/1
  # DELETE /custom_field_values/1.json
  def destroy
    @custom_field_value.destroy
    respond_to do |format|
      format.html { redirect_to custom_field_values_url, notice: 'Custom field value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_field_value
      @custom_field_value = CustomFieldValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_field_value_params
      params.require(:custom_field_value).permit(:contact_id, :custom_field_id, :value)
    end
end
