class Contacts::ImportsController < ApplicationController
  include AccountScoped

  def new
    @import = Import.new
  end

  def create
    @import = @account.imports.create!(import_params)
    redirect_to account_contacts_import_url(@account, @import)
  end

  def show
    @import = @account.imports.find(params[:id])
  end

  private
    def import_params
      params.require(:import).permit(:file)
    end
end
