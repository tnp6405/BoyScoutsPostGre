require 'csv'

class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  # GET /routes
  # GET /routes.json
  def index
    @routes = Route.all
  end

  #GET /routes/showRunSheets
  #This method generates Run Sheets to be displayed on webpage. This mehtod is called when generate Run sheets method is invoked.
  def showRunSheets
    @routesHash = Hash.new
    @routes = Route.all
    @routes.each do |way|
        routeName=way.route_name;
	@routesHash[way.route_name] = Subscription.find_by_sql("SELECT * FROM routes,  subscriptions WHERE ( routes.route_id = subscriptions.route_id and route_name='#{routeName}' and subscription_status <> 'EXPIRED') ")
    end
    return @routesHash
  end
 
  #This method generates html for single route. It takes :route as parameter
  def generatePDFForRunSheets
	route = params[:route]
	puts "Route From generate PDF "
	puts route
        @routesHash = Hash.new
        routeName=route;
	@routesHash[routeName] = Subscription.find_by_sql("SELECT * FROM routes , subscriptions WHERE ( routes.route_id = subscriptions.route_id and route_name='#{routeName}' and subscription_status <> 'EXPIRED') ")
    return @routesHash
  end

  #This method generates HTML for all Routes at once. Whihc is then used to generate PDFs. only difference between this method and showRunSheets is their views.
  def generateRunSheetsForAllRoutesForPDF	 
    @routesHash = Hash.new
    @routes = Route.all
    @routes.each do |way|
        routeName=way.route_name;
	@routesHash[way.route_name] = Subscription.find_by_sql("SELECT * FROM routes, subscriptions WHERE ( routes.route_id = subscriptions.route_id and route_name='#{routeName}' and subscription_status <> 'EXPIRED') ")
    end
    return @routesHash

  end
  def downloadPDFForRunSheets
    kit = PDFKit.new("#{root_url}/routes/generateRunSheetsForAllRoutesForPDF", :page_size => 'Letter');
    pdf = kit.to_pdf 
    send_data(pdf, :filename => "consolidated_RunSheets.pdf",  :type => "application/pdf")	
  end	


  def generateCSVForRunSheets 
	route = params[:route]
        routeName=route;
	puts "RouteName from CSV Generation = #{routeName}"
	routeHash = Hash.new
	routeHash[routeName] = Subscription.find_by_sql("SELECT * FROM routes, subscriptions WHERE ( routes.route_id = subscriptions.route_id and route_name='#{routeName}' and subscription_status <> 'EXPIRED') ")
	csv_string = CSV.generate do |csv|
		csv<<["Seq","Status","street","#","Name","Service Notes","ID"]
		routeHash[routeName].each do |subs|
			csv<<[subs.run_sequence, subs.subscription_status,subs.street+",College station, Texas", subs.qty, subs.last_name,subs.subscription_notes,subs.subscription_id]
		end
	end
	send_data(csv_string, :filename => "#{routeName}.csv", :type=>"text/csv")
  end	

  # GET /routes/1
  # GET /routes/1.json
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  # POST /routes.json
  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routes/1
  # PATCH/PUT /routes/1.json
  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_params
      params.require(:route).permit(:route_id, :route_name, :print_sequence)
    end
end
