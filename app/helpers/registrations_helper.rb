module RegistrationsHelper
  def turns
    {"Nenhum" => "not_student", "Vespertino" => "day", "Noturno" => "night"}
  end

  def courses_with_vacancies
    Course.all.where("vacancies > 0")
  end
end
