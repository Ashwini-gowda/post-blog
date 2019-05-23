class Post < ApplicationRecord
  
  mount_uploader :media, AttachmentUploader   
  validates :title, :body, :author, presence: true 
  has_many :comments

  def increase_visit
    visit_counter+=1
    save!
  end

end