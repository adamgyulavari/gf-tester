class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  dragonfly_accessor :solution_file
  dragonfly_accessor :test_file

  validate :files

  # validates :solution_file_name, inclusion: { in: ['WordToolbox.java'], message: 'should be named as WordToolbox.java' }, unless: 'solution_file_uid.nil?'
  # validates :test_file_name, format: { with: /\ATest[a-zA-Z]+.java\z/, message: 'should be named as Test*.java' }, unless: 'test_file_uid.nil?'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end

  private

  def files
    errors.add(:solution_file, 'should be named as CountAs.java') if solution_file_name && solution_file_name != 'CountAs.java'
    errors.add(:test_file, 'should be named as Cuboid.java') if test_file_name && test_file_name != 'Cuboid.java'
    # errors.add(:test_file, 'should be named as Cuboid.java') if test_file_name && test_file_name.match(/\ATest[a-zA-Z]+.java\z/).nil?
  end

end
