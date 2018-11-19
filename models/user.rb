class User < ActiveRecord::Base
  has_many :calculations

  def full_name
    return "#{first_name} #{last_name}" if !first_name.empty? && !last_name.empty?
    return first_name if !first_name.empty?
    last_name if !last_name.empty?
  end

end
