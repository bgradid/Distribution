class WorkOrder < ActiveRecord::Base
def validate
  if number.nil?
      errors.add_to_base "No number entered" if number.nil?
  else
     # errors.add_to_base "Work Order number must be at least 60,000 and an integer" if number < 60000
     # errors.add_to_base "Is this work order from the far future? W/O must be under 200,000" if number > 200000
  end
end

end
#validates :number, :presence => true,
#            :length => { :minimum => 6 }

def assign_technician
  # if self.ramupgrade == true do
  #   end
  id = find_next()
  @technician = Technician.find(id)
  self.technician = id
  if @technician.count.nil?
    @technician.count = 0
  end
  count = @technician.count + 1
  @technician.update_attributes(:count => count)
  self.assigned = true
end


def find_next
  # This code finds the lowest technician assigned to the work orders over the last day
  # and is also present today
  technicians_present = technicians_present_today()
  lowest = find_work_order_count_yesterday(1)
  # lowest_id = 0
  # yesterdayCount = 0
  for i in technicians_present do
    yesterdayCount = find_work_order_count_yesterday(i)
    if yesterdayCount <= lowest
      lowest = yesterdayCount
      lowest_id = i
    end
  end
  if lowest_id == 0 or lowest_id.nil?
    # This is my 'error code' for not being able to assign a technician
    lowest_id = 4
  end
  return lowest_id
  
  # This is deprecated code that was just used for testing, pretty worthless really
  # @technicians = Technician.find(:all, :order => "count ASC")
  #  return @technicians[0].id
end

def find_work_order_count_yesterday(technicianID)
  @work_orders = WorkOrder.find(:all, :conditions => ["DATE(created_at) BETWEEN ? AND ? AND technician = ?", Time.now.midnight-1.day, Time.now.midnight, technicianID])
  return @work_orders.size
end

def find_work_order_count_two_days_ago(technicianID)
  @work_orders = WorkOrder.find(:all, :conditions => ["DATE(created_at) BETWEEN ? AND ? AND technician = ?", Time.now.midnight-2.day, Time.now.midnight-1.day, technicianID])
  return @work_orders.size
end

def toname
  result = case self.technician
  when "0" then return "Not assigned"
  when "1" then return "XBG"
  when "2" then return "XJR"
  when "3" then return "XKU"
  end
  return result
end

# => Sunday is day 0, Saturday Day 6.
# => ID 1 = Ben, In from Thursday to Monday
# => ID 2 = Jay, In from Sunday to Thursday
# => ID 3 = Kyle, In from Tuesday to Saturday
def technicians_present_today()
  wday = Time.now.wday
  result = case wday
     when 0..1 then ["2","1"]
     when 2..3 then ["3","2"]
     when 4 then ["1","3","2"]
     when 5..6 then ["3","1"]
   end
   return result
end

def technician_first_day(technicianID)
  result = case technicianID
    when 1 then "5"
    when 2 then "0"
    when 3 then "2"
  end
return result
end