class ContactsExport

  # action to return the contents of user table in CSV format
  def export_contacts
    users = User.find(:all)
	CSV.open("temp/export/file.csv", "w") do |csv|
      csv << ["email","encrypted_password","reset_password_token","remember_created_at","sign_in_count",
				"current_sign_in_at","last_sign_in_at","current_sign_in_ip",
				"last_sign_in_ip","created_at","updated_at","first_name","last_name","address_line_1",
				"address_line_2","city","state","postal_code","country","is_admin","is_member",
				"title","middle_name","birth_date","address_line_3","home_phone","work_phone",
				"work_phone_ext","mobile_phone","fax","notes"]
      users.each do |u|
        csv << [u.email,u.encrypted_password,u.reset_password_token,u.remember_created_at,u.sign_in_count,
				u.current_sign_in_at,u.last_sign_in_at,u.current_sign_in_ip,
				u.last_sign_in_ip,u.created_at,u.updated_at,u.first_name,u.last_name,u.address_line_1,
				u.address_line_2,u.city,u.state,u.postal_code,u.country,u.is_admin,u.is_member,
				u.title,u.middle_name,u.birth_date,u.address_line_3,u.home_phone,u.work_phone,
				u.work_phone_ext,u.mobile_phone,u.fax,u.notes]
      end
    end
  end

