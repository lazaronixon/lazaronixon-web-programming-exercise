class ContactsController < ApplicationController
  include AccountScoped

  def index
    @contacts = @account.contacts.all
  end
end
