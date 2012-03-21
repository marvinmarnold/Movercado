class ActorCodesController < ApplicationController
  # GET /actor_codes
  # GET /actor_codes.json
  def index
    @actor_codes = ActorCode.order("created_at desc").page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actor_codes }
    end
  end

  # GET /actor_codes/1
  # GET /actor_codes/1.json
  def show
    @actor_code = ActorCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @actor_code }
    end
  end

  # GET /actor_codes/new
  # GET /actor_codes/new.json
  def new
    @actor_code = ActorCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @actor_code }
    end
  end

  # GET /actor_codes/1/edit
  def edit
    @actor_code = ActorCode.find(params[:id])
  end

  # POST /actor_codes
  # POST /actor_codes.json
  def create
    num_to_gen = params[:actor_code][:num_to_generate]
    num_to_gen = num_to_gen.to_i
    #actor_codes = ""
    actor_codes = []
    logger.info("CODEZ #{num_to_gen}")
  	#num_to_gen.to_i.times do
    @actor_code = ActorCode.new(params[:actor_code])

    respond_to do |format|
      if @actor_code.save
        #actor_codes += "#{@actor_code.id}"
        actor_codes << @actor_code.id
        unless num_to_gen < 2
          (num_to_gen - 1).to_i.times do
            #actor_codes += "&#{ActorCode.create(params[:actor_code]).id}"
            actor_codes << ActorCode.create(params[:actor_code]).id
          end
        end
        format.html { redirect_to created_codes_path(:codes => actor_codes), notice: "#{num_to_gen} actor code(s) successfully created." }
        format.json { render json: @actor_code, status: :created, location: @actor_code }
      else
        format.html { render action: "new" }
        format.json { render json: @actor_code.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def listing
    @actor_codes = []
    params[:codes].each do |code|
      @actor_codes << ActorCode.find(code)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @actor_codes }
    end
  end

  # PUT /actor_codes/1
  # PUT /actor_codes/1.json
  def update
    @actor_code = ActorCode.find(params[:id])

    respond_to do |format|
      if @actor_code.update_attributes(params[:actor_code])
        format.html { redirect_to @actor_code, notice: 'Actor code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @actor_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_codes/1
  # DELETE /actor_codes/1.json
  def destroy
    @actor_code = ActorCode.find(params[:id])
    @actor_code.destroy

    respond_to do |format|
      format.html { redirect_to actor_codes_url }
      format.json { head :no_content }
    end
  end
end
