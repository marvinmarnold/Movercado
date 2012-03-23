module UsersHelper
  def stringify_birthday(birthday)
    if birthday
      birthday
    else
      "Unknown"
    end
  end
  
end
