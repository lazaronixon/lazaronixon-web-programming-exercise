class Import < ApplicationRecord
  belongs_to :account

  has_one_attached :file

  after_create_commit :process_file_later

  enum status: %w[ processing processed failed ].index_by(&:itself)

  def process_file
    import_contacts_from_file
    processed!
  rescue Exception => e
    logger.error "File processing failed with: #{e.message}"
    failed!
  end

  def process_file_later
    ImporterJob.set(wait: 5.seconds).perform_later(self)
  end

  private
    def import_contacts_from_file
      vcards = Vpim::Vcard.decode(file.download)
      vcards.each do |vcard|
        account.contacts.create!(name: vcard.name.fullname, email_address: vcard.email.presence)
      rescue ActiveRecord::ActiveRecordError => e
        logger.debug "Exception while creating #{vcard.email}, failed with: #{e.message}"
      end
    end
end
