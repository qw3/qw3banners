class Banner < ActiveRecord::Base
  
  has_attached_file :imagem, :styles => { :small => "100x100", :thumb => "40x40" }, :path => "#{Rails.root}/public/images/banners/banner_#{:banner_id}/:id/:style/:filename", :url => "/images/banners/banner_#{:banner_id}/:id/:style/:filename", :default_url => "#{ConfiguracaoBanner["path_imagem_nao_disponivel"]}/:style.png"
  
  default_scope :order => "ordem"
  
  before_create :atribuir_ordem
  
  cattr_reader :per_page
  @@per_page = 10
  
  def atribuir_ordem
    if Banner.count.zero?
      self.ordem = 1
    else
      self.ordem = Banner.last.ordem + 1
    end
  end
end
