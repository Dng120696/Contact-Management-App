class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: {minimum:3,maximum:100}
  validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: {maximum:50},
                      format: { with: VALID_EMAIL_REGEX, message: "Invalid email format" }
  validates :phone_number, presence: true,
                      uniqueness: { case_sensitive: false },length: {maximum:11}, format: { with: /\A(09|\+639)\d{9}\z/, message: "must be a valid Philippines phone number" }
 validates :address, presence: true,
                      length: {maximum:100}
end
