class NumberFactsController < ApplicationController
  before_action :set_number_fact, only: [:show, :edit, :update, :destroy]

  # GET /number_facts
  # GET /number_facts.json
  def index
    @number_facts = NumberFact.all
  end

  # GET /number_facts/1
  # GET /number_facts/1.json
  def show
  end

  # GET /number_facts/new
  def new
    @number_fact = NumberFact.new(fun_number: rand(10000), fun_year: rand(-99..(Date.today.year + 100)), fun_date: rand(Date.new(2004)...Date.new(2005)))
  end

  # GET /number_facts/1/edit
  def edit
  end

  # POST /number_facts
  # POST /number_facts.json
  def create
    @number_fact = NumberFact.new(number_fact_params)

    respond_to do |format|
      if @number_fact.save
        format.html { redirect_to @number_fact, notice: 'Number fact was successfully created.' }
        format.json { render :show, status: :created, location: @number_fact }
      else
        format.html { render :new }
        format.json { render json: @number_fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /number_facts/1
  # PATCH/PUT /number_facts/1.json
  def update
    respond_to do |format|
      if @number_fact.update(number_fact_params)
        format.html { redirect_to @number_fact, notice: 'Number fact was successfully updated.' }
        format.json { render :show, status: :ok, location: @number_fact }
      else
        format.html { render :edit }
        format.json { render json: @number_fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_facts/1
  # DELETE /number_facts/1.json
  def destroy
    @number_fact.destroy
    respond_to do |format|
      format.html { redirect_to number_facts_url, notice: 'Number fact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_fact
      @number_fact = NumberFact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def number_fact_params
      params.require(:number_fact).permit(:fun_number, :fun_year, :fun_date, :choice)
    end
end
