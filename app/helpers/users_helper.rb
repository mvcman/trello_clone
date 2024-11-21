module UsersHelper
    def is_holiday(holidays, date)
        holidays.filter {|h| h.start_date <= date && h.end_date >= date }.present?
    end 

    def is_leave(leaves, date)
        leaves.filter {|l| (l.start_date <= Time.zone.parse(date.to_s).beginning_of_day && l.end_date >= Time.zone.parse(date.to_s).end_of_day.change(sec: 0)) || (l.start_date >= Time.zone.parse(date.to_s).beginning_of_day && l.end_date <= Time.zone.parse(date.to_s).end_of_day.change(sec: 0)) }.present?
    end

    def get_holiday_tag
        tag.span(class: "ml-1 uppercase bg-yellow-200 p-1 text-xs text-yellow-700 rounded-md") do
            "HOLIDAY"
        end
    end 

    def get_weekday_tag
        tag.span(class: "ml-1 uppercase bg-indigo-200 p-1 text-xs text-indigo-700 rounded-md") do
            "week off"
        end
    end

    def get_attendance_tag(attendance)
        tag.span(class: "ml-1 uppercase bg-blue-200 p-1 text-xs text-blue-600 rounded-md") do
            "#{attendance.name}"
        end
    end

    def get_leave_tag(leaves, date)
        leave = leaves.find {|l| (l.start_date <= Time.zone.parse(date.to_s).beginning_of_day && l.end_date >= Time.zone.parse(date.to_s).end_of_day.change(sec: 0)) || (l.start_date >= Time.zone.parse(date.to_s).beginning_of_day && l.end_date <= Time.zone.parse(date.to_s).end_of_day.change(sec: 0)) }

        tag.span(class: "ml-1 uppercase bg-red-200 p-1 text-xs text-red-600 rounded-md") do
            "leave"
        end
    end

    def calculate_diff(start_time, end_time)
        if start_time.present? && end_time.present?
            time_diff = end_time - start_time
            hours = (time_diff / 3600).floor 
            minutes = ((time_diff % 3600) / 60).floor
            format("%02d:%02d", hours, minutes) + "
            hrs"
        else
            ""
        end
    end 

    def get_attendance(attendances, date)
        attendance = attendances.filter {|a| a.check_in_time.to_date < Time.zone.today }.find {|a| a.check_in_time >= Time.zone.parse(date.to_s).beginning_of_day && a.check_out_time <= Time.zone.parse(date.to_s).end_of_day.change(sec: 0) }
        if attendance.present?
            check_in = attendance.check_in_time.present? ? attendance.check_in_time.strftime("%I:%M %p") : ''

            check_out = attendance.check_out_time.present? ? attendance.check_out_time.strftime("%I:%M %p") : ''

            diff = calculate_diff(attendance.check_in_time, attendance.check_out_time)
            [attendance.attendance_status, check_in, check_out, diff] 
        else
            [nil, nil, nil, nil]
        end 
    end 

    def get_current_status(holidays, leaves, attendances, date)
        return "Holiday" if holidays.filter {|h| h.start_date <= date && h.end_date >= date }.present?
        return "On Leave" if leaves.filter {|l| l.start_date <= Time.zone.parse(date.to_s).beginning_of_day && l.end_date >= Time.zone.parse(date.to_s).end_of_day.change(sec: 0) }.present?
        at = attendances.find {|a| a.check_in_time != nil && a.check_in_time.to_date == date }
        return at.attendance_status.name if at.present?
        "NA"
    end 

    def is_active?(date, month)
        return true if !date.present? && Time.zone.today.month == month 
        return true if date.present? && Time.zone.parse(date).month == month
        false
    end 
end
