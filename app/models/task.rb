#------------------------------------------------------------------------------
# app/models/task.rb
#------------------------------------------------------------------------------

class Task < ActiveRecord::Base
  belongs_to    :user
  
  attr_writer   :due_text
  
  validates     :description,   presence:   true,   length: { minimum: 2 }
  
  validate      :check_due_text
  before_save   :save_due_text
  
  #----------------------------------------------------------------------------
  # Public Interface
  #----------------------------------------------------------------------------

  def due_text
    @due_text || due.try(:strftime, "%m/%d/%Y")
  end

  def save_due_text
    self.due = Date.strptime(@due_text, "%m/%d/%Y") if @due_text.present?
  end
  
  #
  # Verify that we can convert the date string into a date object, if we cannot then
  # add a validation error
  #
  def check_due_text
    if @due_text.present?
      begin
        self.due = Date.strptime(@due_text, "%m/%d/%Y")
        logger.debug "INFO: Set task due date=[#{self.due.inspect}]"
      rescue ArgumentError => e
        logger.error "ERROR: Failed to parse date string=[#{@due_text}]"
        logger.error "ERROR: #{e.message}"
        logger.error "ERROR: #{e.backtrace.inspect}"

        errors.add :due_date, "failed to parse #{@due_text}"
      rescue TypeError => e
        logger.error "ERROR: Failed to parse date string=[#{@due_text}]"
        logger.error "ERROR: #{e.message}"
        logger.error "ERROR: #{e.backtrace.inspect}"

        errors.add :due_date, "failed to parse #{@due_text}"
      end
    end
  end # end of check_due_text

end # end of class Task
