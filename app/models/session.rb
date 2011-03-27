class Session < ActiveRecord::Base
  belongs_to :camp
  has_many :session_child_registrations
  has_many :children, :through => :session_child_registrations

  def start_date
    @start_date = read_attribute(:start_date)
    if (@start_date)
      @start_date = @start_date.localtime
    end
  end

  def end_date
    @end_date = read_attribute(:end_date)
    if (@end_date)
      @end_date = @end_date.localtime
    end
  end
end
