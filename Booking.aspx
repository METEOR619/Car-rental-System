<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Client_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Booking</title>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null }; 
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Booking</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li><a href="CarList.aspx">Car List</a>  <i class="fa fa-angle-right"></i>
								</li>
                                <li><a href="CarDetails.aspx">Car Details</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Booking</li>
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
                <asp:ListView ID="ListView1" runat="server" onitemdatabound="ListView1_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
					        <div class="x_car_book_left_siderbar_wrapper float_left">
						        <div class="row">
							        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								        <!-- Filter Results -->
								        <div class="car-filter accordion x_inner_car_acc_accor">
									        <h3>Order Details</h3>
									        <hr />
									        <!-- Resources -->
                                            <div>
									            <div class="x_car_access_filer_top_img">
										            <img src='../Admin/assets/images/CarModel/<%#Eval("ModelImage") %>' height="100px" width="250px" alt="img">
										            <h3><%#Eval("BrandName") %> &nbsp;<%#Eval("ModelName") %></h3>
										            <p> &#8377; <%#Eval("Price") %>/Day</p>
									            </div>
									            <hr>
									            <!-- Company -->
									            <!-- Attributes -->
									            <div class="panel panel-default x_car_inner_acc_acordion_padding">
										            <div class="collapse show">
											            <div class="panel-body">
												            <div class="x_car_acc_filter_date">
													            <table class="table">
														            <thead>
															            <tr>
																            <th scope="col" class="text-left">Duration</th>
																            <th scope="col" class="text-right">Rate</th>
																            <th scope="col" class="text-right">Amount</th>
															            </tr>
														            </thead>
														            <tbody>
															            <tr>
																            <td class="text-left">
                                                                                <asp:Label ID="lblQty" runat="server" Text="Qty"></asp:Label> 
                                                                            </td>
																            <td class="text-right"> 
                                                                                <asp:Label ID="lblRate" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                                                                            </td>
																            <td class="text-right">
                                                                                <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                                                                            </td>
															            </tr>
														            </tbody>
													            </table>
												            </div>
											            </div>
										            </div>
									            </div>
                                            </div>
                                            <%--<asp:TextBox ID="txtTmp" runat="server"></asp:TextBox>--%>
									        <hr />
									        <div class="panel panel-default x_car_inner_acc_acordion_padding">
										        <div class="panel-heading car_checkout_caret">
											        <h5 class="panel-title"> <a href="#"> Pick-up Date </a> </h5>
										        </div>
										        <div class="collapse show">
											        <div class="panel-body">
												        <div class="x_car_acc_filter_date text-center">
                                                            <asp:Label ID="lblPickUpDate" runat="server" Text="Pick Up Date"></asp:Label>
												        </div>
											        </div>
										        </div>
									        </div>
									        <hr />
									        <div class="panel panel-default x_car_inner_acc_acordion_padding">
										        <div class="panel-heading car_checkout_caret">
											        <h5 class="panel-title"> <a href="#"> Drop-Off Date </a> </h5>
										        </div>
										        <div class="collapse show">
											        <div class="panel-body">
												        <div class="x_car_acc_filter_date text-center">
													        <asp:Label ID="lblDropOffDate" runat="server" Text="Drop Off Date"></asp:Label>
												        </div>
											        </div>
										        </div>
									        </div>
									        <hr />
									
									        <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										        <div class="panel-heading car_checkout_caret">
											        <h5 class="panel-title"> <a href="#"> GST </a> </h5>
										        </div>
										        <div class="collapse show">
											        <div class="panel-body">
												        <div class="x_car_acc_filter_date row">
                                                            <asp:Label ID="lblCGST" CssClass="col-6" runat="server" Text="CGST 9%"></asp:Label> 
                                                            <asp:Label ID="lblCGSTPrice" CssClass="col-6 text-right" runat="server" Text="Price"></asp:Label>
                                                            <br /><br />
                                                            <asp:Label ID="lblSGST" CssClass="col-6" runat="server" Text="SGST 9%"></asp:Label> 
                                                            <asp:Label ID="lblSGSTPrice" CssClass="col-6 text-right" runat="server" Text="Price"></asp:Label>
                                                            <br />
												        </div>
											        </div>
										        </div>
									        </div>
									        <%--<hr>
									        <div class="panel panel-default x_car_inner_acc_acordion_padding x_car_inner_acc_acordion_padding_last">
										        <div class="collapse show">
											        <div class="panel-body">
												        <div class="x_car_acc_filter_date">
													        <input type="text" placeholder="Coupon Code">
													        <button type="submit"><i class="fa fa-arrow-right"></i>
													        </button>
												        </div>
											        </div>
										        </div>
									        </div>--%>          
                                            <div class="x_car_acc_filter_bottom_total">
                                                <ul>
                                                    <li>
                                                        Total <span><asp:Label ID="lblTotal" runat="server" Text="Total Price"></asp:Label></span>
                                                    </li>
                                                </ul>
									        </div>    
								        </div>
							        </div>
						        </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:ListView>
               
                <asp:ListView ID="ListView2" runat="server" >
                    <ItemTemplate>
                        <div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
					        <div class="x_carbooking_right_section_wrapper float_left">
						        <div class="row">
							        <div class="col-md-12">
								        <div class="x_car_checkout_right_main_box_wrapper float_left">
									        <div class="car-filter order-billing margin-top-0">
										        <div class="heading-block text-left margin-bottom-0">
											        <h4>Billing Details</h4>
										        </div>
										        <hr />
										        <div class="billing-form">
											        <ul class="list-unstyled row">
												        <li class="col-md-6">
													        <label>First Name
                                                                <asp:TextBox ID="txtFName" ReadOnly="true" style="background:white" CssClass="form-control" Text='<%#Eval("FName") %>' runat="server"></asp:TextBox>
                                                                <%--<input type="text" placeholder="" class="form-control">--%>
													        </label>
												        </li>
												        <li class="col-md-6">
													        <label>Last Name
														        <asp:TextBox ID="txtLName" ReadOnly="true" style="background:white" CssClass="form-control" Text='<%#Eval("LName") %>' runat="server"></asp:TextBox>
													        </label>
												        </li>
												        <li class="col-md-12">
													        <label>Driver's License Number
														        <asp:TextBox ID="txtLicense" CssClass="form-control" placeholder="Enter Driver's License Number" runat="server" MaxLength="16"></asp:TextBox>    
													        </label>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Driver's License Number Required" 
                                                            ControlToValidate="txtLicense" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                            ErrorMessage="Enter Proper License Number" ControlToValidate="txtLicense"
                                                            SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic" 
                                                            ValidationExpression="^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((1999|20([01][0-9]|20)))[0-9]{7}$"></asp:RegularExpressionValidator>
												        </li>
												        <li class="col-md-12">
													        <label>Address
														        <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Enter Car Delivery Address" runat="server" TextMode="MultiLine"></asp:TextBox>
													        </label>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Car Delivery Address Required" 
                                                                ControlToValidate="txtAddress" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
												        </li>
												        <li class="col-md-6">
													        <label>Phone
														        <asp:TextBox ID="txtMobile" ReadOnly="true" style="background:white" CssClass="form-control" Text='<%#Eval("Mobile") %>' runat="server"></asp:TextBox>
													        </label>
												        </li>
												        <li class="col-md-6">
													        <label>Email Address
														        <asp:TextBox ID="txtEmail" ReadOnly="true" style="background:white" CssClass="form-control" Text='<%#Eval("Email") %>' runat="server"></asp:TextBox>
													        </label>
												       </li>
											        </ul>
											        <hr />

                                                    <div class="payme-opton">
												        <div class="heading-block text-left margin-bottom-30">
													        <h4>Payment</h4>
												        </div>

                                                        <div class="radio">
                                                            <asp:RadioButtonList ID="RBLPayment" runat="server" style="display:inline">
                                                                <asp:ListItem Text="PayPal" Value="PayPal"></asp:ListItem>
                                                                <asp:ListItem Text="Paytm" Value="Paytm" ></asp:ListItem>
                                                                <asp:ListItem Text="Cash On Arrival" Value="COA"></asp:ListItem>
                                                            </asp:RadioButtonList> 
                                                            <br />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select Payment Method" 
                                                            ControlToValidate="RBLPayment" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        </div>
											        </div>
                                                    <div class="billing-form">
											            <ul class="list-unstyled row">
												            <li class="col-md-12">
													            <div class="contect_btn contect_btn_contact">
                                                                    <asp:Button ID="btnBookNow" runat="server" OnClick="btnBookNow_Click" Text="Book Now" CssClass="btn btn-primary col-6" />
								                                </div>
												            </li>
                                                        </ul>
                                                    </div>
										        </div>
									        </div>
								        </div>
							        </div>
						        </div>
					        </div>
				        </div>
                    </ItemTemplate>
                </asp:ListView>
			</div>
		</div>
	</div>
	<!-- x car book sidebar section Wrapper End -->
</asp:Content>

