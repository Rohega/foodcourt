class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :default_role

  has_and_belongs_to_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :photo,
                    :styles => {
                        :thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end


  private
  def default_role
    self.roles << Role.find_or_create_by(:name => 'admin')
  end
end
