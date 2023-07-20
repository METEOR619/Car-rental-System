<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="BookingHistory.aspx.cs" Inherits="Client_BookingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Booking History</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Booking History</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Booking History</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->

    <div class="x_contact_title_main_wrapper float_left">
		<div class="container">
			<div class="row">
                <div class="login_wrapper">
                    <div class="row">
				        <div class="col-md-12">
					        <div class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						        <h3>Booking History</h3>
					        </div>
				        </div>

				        <div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ListView ID="LVCarList1" runat="server" 
                                onitemdatabound="LVCarList1_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-12">
										<div class="x_car_history_wrapper float_left">
											<div class="x_car_offer_starts_list_img float_left" style="border-right: 0px">							    
                                                <div class="x_car_offer_img x_car_offer_img_list float_left" style="padding: 10px">
                                                    <img src='../Admin/assets/images/CarModel/<%#Eval("ModelImage") %>' alt="img" class="w-100">
												</div>
											</div>

											<div class="x_car_history_img_cont">
                                                <h3>#<%#Eval("BookingID") %></h3> <br />
                                                <div class="row" style="margin: 0px">
                                                    <h3><%#Eval("BrandName") %></h3> &nbsp;&nbsp; <h3><%#Eval("ModelName") %></h3> <br /><br />
                                                    
                                                </div>
                                                <div>
                                                    Pick Up Date :   
                                                    <asp:Label ID="lblPickUpDate" runat="server" Text='<%#Eval("PickUpDate")%>'></asp:Label>
                                                    <br />

                                                    Drop Off Date:
                                                    <asp:Label ID="lblDropOffDate" runat="server" Text='<%#Eval("DropOffDate")%>'></asp:Label>
                                                    <br />

                                                    Duration:
                                                    <asp:Label ID="lblDuration" runat="server" Text='<%#Eval("Qty")%>'></asp:Label>
                                                    <br />
    
                                                    City:
                                                    <asp:Label ID="lblCity" runat="server" Text='<%#Eval("CityName")%>'></asp:Label>
                                                    <br />

                                                    Total:
                                                    <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("Total")%>'></asp:Label>
                                                    <br />
                                                </div>
											</div>
										</div>
									</div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                        <asp:Panel ID="Panel1" Width="100%" runat="server" Visible="False">                            
						    <div class="text-center" style="padding:30px 0px">
                                <h3>No History Found!</h3>
                            </div>
                            
                        </asp:Panel>
                        
				        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					        <div class="contect_btn contect_btn_contact">
                                <br />
                                <asp:Button ID="btnHome" CssClass="btn btn-primary" runat="server" Text="Home" 
                                    onclick="btnHome_Click" />
					        </div>
				        </div>
                    </div>   
                </div>
			</div>
            <br />
		</div>
	</div>
</asp:Content>

