module RegistrationsHelper
  def turns
    {"Vespertino" => "day", "Noturno" => "night"}
  end

  def courses_with_vacancies
    Course.all.where("vacancies > 0")
  end
end
