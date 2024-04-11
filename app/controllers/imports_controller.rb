class ImportsController < ApplicationController
  include AccountScoped

  def new
    @import = @account.imports.build
  end

  def create
    @import = @account.imports.create!(import_params)
    redirect_to account_import_url(@account, @import)
  end

  def show
    @import = @account.imports.find(params[:id])
  end

  private
    def import_params
      params.require(:import).permit(:file)
    end
end
