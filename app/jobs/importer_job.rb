class ImporterJob < ApplicationJob
  queue_as :default

  def perform(import)
    import.process_file
  end
end
