class Import < ApplicationRecord
  belongs_to :account

  has_one_attached :file

  after_create_commit :process_file_later

  enum status: %w[ processing processed failed ].index_by(&:itself)

  def process_file
    # implement here
  end

  def process_file_later
    ImporterJob.perform_later(self)
  end
end
