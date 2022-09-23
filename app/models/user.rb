class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:employee,:admin]

  after_create :set_default_role

  belongs_to :role, optional: true

  has_many :projects, dependent: :destroy

  has_many  :emp_attendances, dependent: :destroy

  has_one  :salary, dependent: :destroy

  has_many :breaks, dependent: :destroy

  validates_each :user_name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  # validates :user_mobileno , numericality: { only_integer: true },  length: { in: 5..20 }

  

  private 

  def set_default_role
    self.update(role_id: Role.find_by(code: 'employee').id)
  end

  def self.search_by(search_term)
    where("LOWER(user_name) LIKE :search_term OR LOWER(email) LIKE :search_term", search_term: "%#{search_term.downcase}")
  end

end
