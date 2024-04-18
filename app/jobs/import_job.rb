class ImportJob < ApplicationJob
  queue_as :importation

  def perform(import)
    import.process_file
  end
end
