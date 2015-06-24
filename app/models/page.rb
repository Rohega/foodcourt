class Page < ActiveRecord::Base

  has_attached_file :photo,
                    :styles => {
                        :thumb => "100x100#",
                        :small  => "150x150>",
                        :medium => "200x200",
                        :big => "843x403#"}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
