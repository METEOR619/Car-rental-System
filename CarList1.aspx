<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="CarList1.aspx.cs" Inherits="Client_CarList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Car List</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
    <div class="btc_tittle_main_wrapper">
	    <div class="btc_tittle_img_overlay"></div>
	    <div class="container">
		    <div class="row">
			    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				    <div class="btc_tittle_left_heading">
					    <h1>Car List</h1>
				    </div>
			    </div>
			    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
				    <div class="btc_tittle_right_heading">
					    <div class="btc_tittle_right_cont_wrapper">
						    <ul>
							    <li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
							    </li>
							    <li>Car List</li>	
						    </ul>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
    <!-- btc tittle Wrapper End -->
    
    <!-- x car book sidebar section Wrapper Start -->
    <div class="x_car_book_sider_main_Wrapper float_left">
	    <div class="container">
            <br /><br />
		    <div class="row">
			    <div class="col-xl-3 col-lg-4 col-md-12 col-sm-12 col-12">
				    <div class="x_car_book_left_siderbar_wrapper float_left">
					    <div class="row">
						    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							    <!-- Filter Results -->
							    <div class="car-filter accordion car_booking_onliy_side">
								    <h3>Filter Results</h3>
								    <hr>

                                    <%--<!-- City -->
								    <div class="x_car_book_fillter_select_box">
									    <h5>City</h5>
                                        <asp:DropDownList ID="DDLSelectCity" CssClass="form-control" AppendDataBoundItems="True" runat="server">
                                        </asp:DropDownList>
								    </div>
								    <hr/>--%>

								    <!-- Category -->
								    <div class="x_car_book_fillter_select_box">
									    <h5>Category</h5>
                                        <asp:DropDownList ID="DDLCarCategory" CssClass="form-control" AppendDataBoundItems="True" runat="server">
                                        </asp:DropDownList>
								    </div>
								    <hr/>

								    <!-- Brand -->
                                    <div class="x_car_book_fillter_select_box">
									    <h5>Car Brand</h5>
                                        <asp:DropDownList ID="DDLCarBrand" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True" 
                                                onselectedindexchanged="DDLCarBrand_SelectedIndexChanged"  runat="server">
                                        </asp:DropDownList>
								    </div>
								    <hr/>

								    <!-- Car Model -->
								    <div class="x_car_book_fillter_select_box">
									    <h5>Car Model</h5>
                                        <asp:DropDownList ID="DDLCarModel" CssClass="form-control" AppendDataBoundItems="True" runat="server">
                                        </asp:DropDownList>
								    </div>
								    <hr/>

								    <!-- Attributes -->
								    <div class="panel panel-default">
									    <div class="panel-heading">
										    <h5 class="panel-title"> <a data-toggle="collapse" href="#collapseThree" class="collapse"> Attributes</a> </h5>
									    </div>
									    <div id="collapseThree" class="collapse show">
										    <div class="panel-body">
											    <div class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
												    <input type="checkbox" id="cbDiesel" name="cb" />
												    <label for="cbDiesel">Diesel</label>
											    </div>
											    <div class="x_slider_checkbox x_slider_checkbox_bottom_filter_use">
												    <input type="checkbox" id="cbPetrol" name="cb" />
												    <label for="cbPetrol">Petrol</label>
											    </div>
										    </div>
									    </div>
								    </div>
								    <hr/>

								    <div class="x_slider_checout_right x_slider_checout_right_carbooking x_slider_checout_right_carbooking_fiter">
									    <ul>
										    <li>
                                                <asp:LinkButton ID="btnFilter" runat="server">Filter <i class="fa fa-arrow-right"></i></asp:LinkButton>
										    </li>
									    </ul>
								    </div>
							    </div>
						    </div>
					    </div>
				    </div>
			    </div>

			    <div class="col-xl-9 col-lg-8 col-md-12 col-sm-12 col-12">
				    <div class="x_carbooking_right_section_wrapper float_left">
					    <div class="row">
						    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							    <div class="x_carbook_right_select_box_wrapper float_left">
								    <select class="myselect">
									    <option>-- Sort --</option>
                                        <option>Sort by Price High To Low</option>
									    <option>Sort by Price Low To High</option>
								    </select>
							    </div>
						    </div>
						    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							    <div class="x_carbook_right_tabs_box_wrapper float_left">
								    <ul class="nav nav-tabs">
									    <li class="nav-item">
										    <a class="nav-link active" data-toggle="tab" href="#view1"> <i class="flaticon-menu"></i>
										    </a>
									    </li>
									    <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#view2"><i class="flaticon-list"></i></a>
									    </li>
								    </ul>
								    <%--<p><span>Showing 1-12</span> of 256 results</p>--%>
							    </div>
						    </div>
						    <div class="col-md-12">
							    <div class="x_car_book_tabs_content_main_wrapper">
								    <div class="tab-content">
									    <div id="view1" class="tab-pane active">
										    <div class="row">
                                                <asp:ListView ID="LVCarList1" runat="server" >
                                                <ItemTemplate>
                                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12">
												    <div class="x_car_offer_main_boxes_wrapper float_left">
														                                                                                                              
                                                        <%-- Car Image --%>
													    <div class="x_car_offer_img float_left">
														    <img src='../Admin/assets/images/CarModel/<%#Eval("ModelImage") %>' alt="img" height="73px" width="190px">
													    </div>
                                                        
                                                        <%-- Discount --%>
													    <div class="x_car_offer_price float_left">
														    <div class="x_car_offer_price_inner">
															    <h3>&#8377; <%#Eval("Price") %></h3>
															    <p><span>from</span> 
																    <br>/ day</p>
														    </div>
													    </div>
                                                        
                                                        <%-- Company & Model Name --%>
													    <div class="x_car_offer_heading float_left">
														    <h2><a href="#"><%#Eval("BrandName") %></a></h2>
														    <p><%#Eval("ModelName") %></p>
													    </div>
                                                        
                                                        <%-- Car Details --%>
													    <div class="x_car_offer_heading float_left">
														    <ul>
															    <li>	<a href="#"><i class="fa fa-users"></i> <%#Eval("Seats") %></a>
															    </li>
															    <li>	<a href="#"><i class="fa fa-briefcase"></i> <%#Eval("BagSpace") %></a>
															    </li>
															    <li>	<a href="#"><i class="fa fa-cogs"></i><%#Eval("GearType") %></a>
															    </li>
															    
														    </ul>
													    </div>
                                                        
                                                        <%-- Booking button --%>
													    <div class="x_car_offer_bottom_btn float_left">
														    <ul>
															    <li><a href='CarDetails.aspx?MDetailsID=<%#Eval("MDetailsID") %>'>Details</a></li>
														    </ul>
													    </div>
												    </div>
											    </div>
                                                </ItemTemplate>
                                                </asp:ListView>
										    </div>
									    </div>

									    <div id="view2" class="tab-pane fade">
										    <div class="row">
                                                <asp:ListView ID="LVCarList2" runat="server">
                                                <ItemTemplate>
                                                    <div class="col-md-12">
													    <div class="x_car_offer_main_boxes_wrapper float_left">

														    <div class="x_car_offer_starts_list_img float_left">	
                                                               															    
                                                                <div class="x_car_offer_img x_car_offer_img_list float_left">
                                                                    <img src='../Admin/assets/images/CarModel/<%#Eval("ModelImage") %>' alt="img" height="73px" width="190px">
															    </div>
															    
                                                                <div class="x_car_offer_price x_car_offer_price_list float_left">
																    <div class="x_car_offer_price_inner x_car_offer_price_inner_list">
																    <h3>&#8377; <%#Eval("Price") %></h3>
																	    <p><span>from</span> 
																		    <br>/ day</p>
																    </div>
															    </div>
														    </div>

														    <div class="x_car_offer_starts_list_img_cont">
															    <div class="x_car_offer_heading x_car_offer_heading_list float_left">
																    <h2><a href="#"><%#Eval("BrandName") %></a></h2>
																    <p><%#Eval("ModelName") %></p>
															    </div>
															    <div class="x_car_offer_bottom_btn x_car_offer_bottom_btn_list float_left">
																    <ul>
																	    <li><a href='CarDetails.aspx?MDetailsID=<%#Eval("MDetailsID") %>'>Details</a>
																	    </li>
																    </ul>
															    </div>
															    <div class="x_car_offer_heading x_car_offer_heading_listing float_left">
																    <ul class="">
																	    <li>	<a href="#"><i class="fa fa-users"></i> &nbsp;<%#Eval("Seats") %> Seats</a>
																	    </li>
																	    <li>	<a href="#"><i class="fa fa-briefcase"></i> &nbsp;<%#Eval("BagSpace") %> Bag Space</a>
																	    </li>
																	    <li style="width: 33.33%;">	<a href="#"><i class="fa fa-cogs"></i> &nbsp;<%#Eval("GearType") %> </a>
																	    </li>
																    </ul>
															    </div>
														    </div>
													    </div>
												    </div>
                                                </ItemTemplate>
                                                </asp:ListView>			
										    </div>
									    </div>
								    </div>
							    </div>
						    </div>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
    <!-- custom js-->
    <!-- x car book sidebar section Wrapper End -->
</asp:Content>

