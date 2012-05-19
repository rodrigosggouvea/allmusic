class StudiosController < ApplicationController
  
  before_filter :check_user, :only => [:edit, :update, :destroy]
  before_filter :load_neighborhoods, :only => [:new, :edit, :create, :update]
  
  def index
    @studios = Studio.where(:pending => false)
    if params[:q_bairro] != 'bairro'
      @studios = @studios.search_neighborhood(params[:q_bairro])
    end
    if !params[:q_busca].blank?
      @studios = @studios.search(params[:q_busca])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studios }
    end
  end

  def approve_index
    unless User.find_by_id(session[:user_id]).password == "admin"
     redirect_to root_path, :notice => "voce nao tem permissao para fazer isso."
    else
    @studios = Studio.where(:pending => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @studios }
    end
end
  end

  def show
    @studio = Studio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @studio }
    end
  end

  def new
    @studio = Studio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @studio }
    end
  end

  def edit
  end

  def create
    @studio = Studio.new(params[:studio])

    respond_to do |format|
      if @studio.save
        format.html { redirect_to @studio, notice: 'Studio was successfully created.' }
        format.json { render json: @studio, status: :created, location: @studio }
      else
        format.html { render action: "new" }
        format.json { render json: @studio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @studio.update_attributes(params[:studio])
        format.html { redirect_to @studio, notice: 'Studio was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @studio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @studio.destroy

    respond_to do |format|
      format.html { redirect_to studios_url }
      format.json { head :ok }
    end
  end

  def approve
    unless User.find_by_id(session[:user_id]).password == "admin"
     redirect_to root_path, :notice => "voce nao tem permissao para fazer isso."
    else
    if Studio.find(params[:id]).approve
     redirect_to root_path, :notice => "estudio aprovado"
    else
     redirect_to root_path, :notice => "nao foi possivel aprovar o studio"
    end
    end
  end

  private
  def check_user
    @studio = Studio.find(params[:id])
    unless session[:user_id] == @studio.user_id
      redirect_to root_path, :notice => "Voce nao tem permissao para isso."
    end  
  end
def load_neighborhoods
@neighborhoods = Studio::NEIGHBORHOODS
end
end
