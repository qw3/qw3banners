class Banner < ActiveRecord::Base
  
  has_attached_file :imagem, :styles => { :small => "100x100", :thumb => "40x40" }, :path => "public/images/banners/banner_#{:banner_id}/:id/:style/:filename", :url => "/images/banners/banner_#{:banner_id}/:id/:style/:filename", :default_url => "#{Settings["PAPERCLIP.missing_path"]}/:style.png"
  
  validates_attachment :imagem,
    presence: true,
    size: { in: 0..2.megabytes },
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png",  "image/tiff"] }
  
  default_scope :order => "ordem"
  
  before_create :atribuir_ordem
  
  def atribuir_ordem
    if Banner.count.zero?
      self.ordem = 1
    else
      self.ordem = Banner.last.ordem + 1
    end
  end
end
