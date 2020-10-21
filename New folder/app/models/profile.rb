class Profile < ActiveRecord::Base
  belongs_to :user
  validate :first_name_or_last_name_null
  validates :gender, :inclusion => %w(male female) 
  validate :male_cannot_firstname_sue


  def first_name_or_last_name_null
  	if first_name == nil && last_name == nil
  		errors.add(:base, "first_name or last_name to be null but not both")
  	end
  end

  def male_cannot_firstname_sue
  	if gender =="male" && first_name == "Sue"
  		errors.add(:gender, "male cannot has first_name Sue")
  	end
  end

 #def get_all_profiles(minyear, maxyear)
 # 	Profile.where("birth_year BETWEEN ? AND ?", minyear, maxyear).order(birth_year: :asc)
 #end  #HV: this is my code and its correct

 def self.get_all_profiles(min_birth_year, max_birth_year)
  	Profile.where("birth_year BETWEEN :min_birth_year AND :max_birth_year", min_birth_year: min_birth_year, max_birth_year: max_birth_year).order(birth_year: :asc)
  end

end
