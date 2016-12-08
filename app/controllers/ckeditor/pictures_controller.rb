class Ckeditor::PicturesController < Ckeditor::ApplicationController
  def index
    if current_user.admin == true
      @pictures = Ckeditor.picture_adapter.find_all(ckeditor_pictures_scope)
    else
      @pictures = Ckeditor.picture_adapter.find_all(ckeditor_pictures_scope(assetable_id: ckeditor_current_user))
    end
    @pictures = Ckeditor::Paginatable.new(@pictures).page(params[:page])
    respond_to do |format|
      format.html { render layout: @pictures.first_page? }
    end
  end
  def create
    @picture = Ckeditor.picture_model.new
    respond_with_asset(@picture)
  end
  def destroy
    @picture.destroy
    respond_with(@picture, :location => pictures_path)
  end
  protected
  def find_asset
    @picture = Ckeditor.picture_adapter.get!(params[:id])
  end
  def authorize_resource
    model = (@picture || Ckeditor.picture_model)
    @authorization_adapter.try(:authorize, params[:action], model)
  end
end