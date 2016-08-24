class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :signature, SignatureUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :applied_requests, class_name: "Request", foreign_key: :applied_id					
  has_many :petitioned_requests, class_name: "Request", foreign_key: :petitioner_id				
  has_many :answers
  has_many :monitorings
  has_many :work_days
  has_many :Approvals

  before_create :set_status  

  scope :administrators, ->{where(role: Role.find_by(name: "Administrador"))}
  scope :monitors, ->{where(role: Role.find_by(name: "Monitor"))}

  scope :inactive, ->{where(status: "inactive")}

  scope :active, ->{where(status: "active")}

  scope :rejected, ->{where(status: "rejected")}

  scope :dissaprove_monitor, ->{where(status: "disapprove")}

  scope :monitor, -> (user_id) { where(user_id: user_id  ) }

   #scope :current_user_sign_in, ->{where(current_sign_in_at: )}
  
  def admin?
    self.role.name == "Administrador"
  end

  def monitor?
    self.role.name == "Monitor"
  end

  def set_status
    self.role.try(:name) == "Administrador" ? self.status = "active" : self.status = "inactive"
    self.role ||= Role.find_by(name: "Monitor")
  end

  def approve
    self.status = "active"
    self.save
  end

  def disapprove
    self.status = "inactive"
    self.save
  end


  def active?
    self.status == "active"
  end

  def inactive?
    self.status == "inactive"
  end

  def reject
    self.status = "rejected"
    #self.email = "vacio"
    self.save
    #self.destroy
  end

  def rejected?
    self.status == "rejected"
  end

  def dissaprove_monitor
    self.status = "disapprove"
    self.save  
  end


  def dissaprove_monitor?
    self.status == "disapprove"
  end

end
