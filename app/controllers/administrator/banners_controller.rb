class Administrator::BannersController < Administrator::AdminController
  
  before_filter :configuracoes_menu_detalhes
  
  # GET /banners
  # GET /banners.xml
  def index
    @banners = Banner.paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @banners }
    end
  end

  # GET /banners/new
  # GET /banners/new.xml
  def new
    @banner = Banner.new
    @banner.publicado = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.xml
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to(administrator_banners_path, :notice => 'Banner criado com sucesso.') }
        format.xml  { render :xml => @banner, :status => :created, :location => @banner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.xml
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to( administrator_banners_path, :notice => 'Banner atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.xml
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to( administrator_banners_url ) }
      format.xml  { head :ok }
    end
  end
  
  def publicar 
    @banner = Banner.find(params[:id])
    @banner.publicado = !@banner.publicado
    @banner.save
    respond_to do |format|
      format.html { redirect_to(administrator_banners_url) }
      format.xml  { head :ok }
    end
  end
  
  def multi_remover
    
    ids = params[:cid]
    if !ids.nil? and !ids.count.zero?
      ids.each do |id|
        if !id.empty?
          banner = Banner.find(id)
          banner.destroy
        end
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(administrator_banners_url) }
      format.xml  { head :ok }
    end
  end
  
  def multi_publicar 
    
    ids = params[:cid]
    if !ids.nil? and !ids.count.zero?
      ids.each do |id|
        if !id.empty?
          banner = Banner.find(id)
          banner.publicado = params[:publicar]
          banner.save
        end
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(administrator_banners_url) }
      format.xml  { head :ok }
    end
  end
  
  def ordenar
    ids = params[:cid]
    if !ids.nil? and !ids.count.zero?
      banner = Banner.find ids.first
      if !params[:cima].nil? and params[:cima].to_i == 0
        banner.ordem = banner.ordem + 1
        banner2 = Banner.find_by_ordem banner.ordem
        if !banner2.nil?
          banner2.ordem = banner2.ordem - 1
          banner2.save
          banner.save
        end
      else
        banner.ordem = banner.ordem - 1
        banner2 = Banner.find_by_ordem banner.ordem
        if !banner2.nil?
          banner2.ordem = banner2.ordem + 1
          banner2.save
          banner.save
        end
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(administrator_banners_url) }
      format.xml  { head :ok }
    end
  end
  
end
