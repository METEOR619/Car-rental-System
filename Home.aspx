<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Client_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Home</title>
    <script type="text/javascript">
        function pageLoad() {
            $(function () {
                $("#<%= txtPickUpDate.ClientID %>").datepicker({
                    maxViewMode: 1,
                    format: "dd/mm/yyyy",
                    startDate: "-today",
                    endDate: "+60d",
                    autoclose: true
                }).on('changeDate', function (selected) {
                    var minDate = new Date($(this).datepicker('getDate'));
                    var d = new Date(minDate);
                    d.setDate(d.getDate() + 1);
                    $("#<%= txtDropOffDate.ClientID %>").datepicker('setStartDate', d);
//                    var m = new Date(minDate);
//                    m.setDate(m.getDate() + 10);
//                    $("#<%= txtDropOffDate.ClientID %>").datepicker('setEndDate', m);
                });

                $("#<%= txtDropOffDate.ClientID %>").datepicker({
                    maxViewMode: 1,
                    format: "dd/mm/yyyy",
                    startDate: "+1d",
                    endDate: "+60d",
                    autoclose: true
                });

                $('.input-daterange').datepicker({

                });
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <!-- hs Slider Start -->
    
	<div class="slider-area float_left">
		<div id="carousel-example-generic" class="carousel slide" data-interval="false" data-ride="carousel">
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<div class="carousel-captions caption-1">
						<div class="container">
							<div class="row">
								<div class="col-12">
                                    <center>
                                        <div class="content">
										    <h2 data-animation="animated fadeInLeft">Cars on rent at cheap price<br>
                                            at your desired destination</h2>
										    <p data-animation="animated bounceInUp">One of our top priorities is to adjust each package we offer to our
											    <br>customer’s exact needs. Rental Cars <span>Starting @ &#8377;500 /day</span>
										    </p>
										    <div class="clear"></div>
									    </div>
                                    </center>									
								</div>								
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="carousel-captions caption-2">
						<div class="container">
							<div class="row">
								<div class="col-12">
                                    <center>
                                        <div class="content">
										    <h2 data-animation="animated fadeInLeft">Cars on rent at cheap price<br>at your desired destination</h2>
										    <p data-animation="animated bounceInUp">One of our top priorities is to adjust each package we offer to our
											    <br>customer’s exact needs. Rental Cars <span>Starting @ &#8377;500 /day</span>
										    </p>
										    <div class="clear"></div>
									    </div>
                                    </center>
								</div>							
							</div>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<div class="carousel-captions caption-3">
						<div class="container">
							<div class="row">
								<div class="col-12">
                                    <center>
                                        <div class="content">
										    <h2 data-animation="animated fadeInLeft">Cars on rent at cheap price<br>at your desired destination</h2>
										    <p data-animation="animated bounceInUp">One of our top priorities is to adjust each package we offer to our
											    <br>customer’s exact needs. Rental Cars <span>Starting @ &#8377;500 /day</span>
										    </p>
										    <div class="clear"></div>
									    </div>
                                    </center>
								</div>
							</div>
						</div>
					</div>
				</div>
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"><span class="number"></span>
					</li>
					<li data-target="#carousel-example-generic" data-slide-to="1" class=""><span class="number"></span>
					</li>
					<li data-target="#carousel-example-generic" data-slide-to="2" class=""><span class="number"></span>
					</li>
				</ol>
				<div class="carousel-nevigation">
					<a class="prev" href="#carousel-example-generic" role="button" data-slide="prev"><i class="fa fa-angle-left"></i>
					</a>
					<a class="next" href="#carousel-example-generic" role="button" data-slide="next"> <i class="fa fa-angle-right"></i>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- hs Slider End -->
    <div class="row">
        <div class="col-xl-3"></div>
        <div class="col-xl-6 col-sm-12">
	        <div class="x_responsive_form_wrapper x_responsive_form_wrapper2 float_left">
		        <div class="container">
			        <div class="x_slider_form_main_wrapper float_left">
				        <div class="x_slider_form_heading_wrapper float_left">
					        <h3>Let’s find your perfect car</h3>
				        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
					                <div class="col-md-12">
						                <div class="x_slider_form_input_wrapper float_left">
							                <h3>Select State</h3>
                                            <asp:DropDownList ID="DDLSelectState" runat="server" CssClass="form-control" 
                                            AutoPostBack="True" 
                                            onselectedindexchanged="DDLSelectState_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="State Required" InitialValue="-- Select State --" 
                                            ControlToValidate="DDLSelectState" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>    
						                </div>
					                </div>
					                <div class="col-md-12">
						                <div class="x_slider_form_input_wrapper float_left">
							                <h3>Select City</h3>
                                            <asp:DropDownList ID="DDLSelectCity" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="City Required" InitialValue="-- Select City --" 
                                            ControlToValidate="DDLSelectCity" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>   
						                </div>
					                </div>
                            
					                <div class="input-daterange input-group">
                                        <div class="col-md-6">
						                    <div class="form-sec-header">
							                    <h3>Pick-up Date</h3>
							                    <label class="cal-icon">
                                                    <asp:TextBox ID="txtPickUpDate" CssClass="form-control"  runat="server"></asp:TextBox><br />
							                    </label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pick Up Date Required" 
                                                    ControlToValidate="txtPickUpDate" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
						                    </div>
					                    </div>
                         
					                    <div class="col-md-6">
						                    <div class="form-sec-header">
							                    <h3>Drop-Off Date</h3>
							                    <label class="cal-icon">
                                                    <asp:TextBox ID="txtDropOffDate" CssClass="form-control" runat="server"></asp:TextBox><br />
                                                </label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Drop Off Date Required" 
                                                    ControlToValidate="txtDropOffDate" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
						                    </div>
					                    </div>       
                                    </div>

					                <div class="col-md-6">
                                        <div class="x_slider_checout_left">    
                                             <ul>
									            <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;24/7 Phone Support</li>
									            <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;No Credit Card Fees</li>
									            <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;No Hidden Charges</li>
								            </ul>
                                        </div>
							        </div>
					        
                                    <div class="col-md-6">
							            <div class="x_slider_checout_right">
                                            <%--<a href="#">search <i class="fa fa-arrow-right"></i></a>--%>
                                            <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" 
                                                onclick="btnSearch_Click" />
                                        </div>           
							        </div>
				                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
			        </div>
		        </div>
	        </div>
	    </div>
    </div>
    <!-- xs Slider bottom title Start -->
	<div class="x_slider_bottom_title_main_wrapper">
		<div class="x_slider_bottom_box_wrapper">	<i class="flaticon-magnifying-glass"></i>
			<h3><a href="#">24 / 7 CAR SUPPORT</a></h3>
			<p>Our honest employee always ready to help customers so the customers can contact us on anytime.
            </p>
		</div>
		<div class="x_slider_bottom_box_wrapper">	<i class="flaticon-world"></i>
			<h3><a href="#">LOTS OF LOCATION</a></h3>
			<p>We provide wide range of location so that customers can enjoy our ride at most of the popular city in india. 
            </p>
		</div>
		<div class="x_slider_bottom_box_wrapper">	<i class="flaticon-checklist"></i>
			<h3><a href="#">RESERVATION ANYTIME</a></h3>
			<p>With the help of CarTravel customers can reserve their ride anytime from anywhere to enjoy the ride.
            </p>
		</div>
		<div class="x_slider_bottom_box_wrapper">	<i class="flaticon-car-trip"></i>
			<h3><a href="#">Rentals Cars</a></h3>
			<p>Customers can rents wide range of cars with different different model and facilites.
            </p>
		</div>
	</div>
	<!-- xs Slider bottom title End -->

	<!-- x counter Wrapper Start -->
	<div class="x_counter_main_wrapper">
		<div class="x_counter_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_counter_car_heading_wrapper float_left">
						<h4>Work Process</h4>
						<h3>How it works?</h3>
						<p>Our website will helps you to rent a car according to your choice in just 4 easy steps.</p>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
					<div class="x_cou_main_box_wrapper">
						<div class="x_icon"> <i class="flaticon-airplane-shape"></i> 
						</div>
						<h5><span>1.</span> <a href="#">pick destination</a></h5>
						<p>Pick your destination place where you want to travel.</p>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
					<div class="x_cou_main_box_wrapper">
						<div class="x_icon"> <i class="flaticon-calendar"></i> 
						</div>
						<h5><span>2.</span> <a href="#">select term</a></h5>
						<p>Choose your car booking date when you want to travel.</p>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
					<div class="x_cou_main_box_wrapper">
						<div class="x_icon"> <i class="flaticon-sedan-car-front"></i> 
						</div>
						<h5><span>3.</span> <a href="#">choose a car</a></h5>
						<p>Choose car according to your choice and also see every details about that car.</p>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
					<div class="x_cou_main_box_wrapper x_cou_main_box_wrapper_last">
						<div class="x_icon"> <i class="flaticon-emoticon-square-smiling-face-with-closed-eyes"></i> 
						</div>
						<h5><span>4.</span> <a href="#">enjoy the ride</a></h5>
						<p>At last choose payment method and enjoy your travel with your choosed car.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- x counter Wrapper End -->
	<!-- x booking Wrapper Start -->
	<div class="x_booking_main_wrapper float_left">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="float_left">
						<img src="assests/images/logo/LogoFullWhite.png" class="w-100" alt="logo" />
					</div>
				</div>
				<div class="col-md-9 py-3">
					<div class="x_book_logo_heading_wrapper float_left">
						<h3>Book your car now on Car Travel!</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- x booking Wrapper End -->

	<!-- btc team Wrapper Start -->
	<div class="x_why_main_wrapper">
		<div class="x_why_img_overlay"></div>
		<div class="container">
			<div class="x_why_left_main_wrapper">
				<img src="assests/images/design/w1.png" alt="car_img">
			</div>
			<div class="x_why_right_main_wrapper" style="padding-left: 50px;">
				<h3>Why Choose Us ?</h3>
				<p>We aim provide leading car brands and top model of that brand. We always ready to help our customers. We are leading in this field from the last 3 years. We have most honest employee. 
					<br>
					<br>Our company always come up with new discount offers and day celebration offers so our regular customers can take benefits from that. We always gave our best to solve customers problem.</p>

				<ul>
					<li><a href="AboutUs.aspx">read more <i class="fa fa-arrow-right"></i></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- btc team Wrapper End -->
</asp:Content>

