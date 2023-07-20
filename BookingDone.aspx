<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="BookingDone.aspx.cs" Inherits="Client_BookingDone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Booking Done</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Booking Done</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
                                <li><a href="#">Booking</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Booking Done</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="x_car_donr_main_box_wrapper float_left padding_tb_60">
		<div class="container">
			<div class="x_car_donr_main_box_wrapper_inner">
				<div class="order-done"> 
                    <i class="icon-checked"><img src="assests/images/design/icon-checked.png" alt="" /></i>
					<h4>thank you! Booking has been Done</h4>
					<h4>Booking number: 
                        <span> 
                            <asp:Label ID="lblBookingNo" runat="server" Text="Booking No"></asp:Label> 
                        </span>
                    </h4>
					<hr />
					<h4>Summary</h4>
					<ul class="row list-unstyled">
                        <li class="col-md-12">
							<h6>User Information</h6>
                            <asp:Label ID="lblFName" runat="server" Text="FName"></asp:Label>
                            <asp:Label ID="lblLName" runat="server" Text="LName"></asp:Label> <br />
                            <asp:Label ID="lblMobile" runat="server" Text="Mobile"></asp:Label> <br />
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
						</li>
						<li class="col-md-6">
							<h6>Pick Up Date</h6>
                            <asp:Label ID="lblPickUpDate" runat="server" Text="Pick Up Date"></asp:Label>
						</li>
						<li class="col-md-6">
							<h6>Drop Off Date</h6>
                            <asp:Label ID="lblDropOffDate" runat="server" Text="Drop Off Date"></asp:Label>
						</li>
						<li class="col-md-6">
							<h6>Car Details</h6>
                            <asp:Label ID="lblBrandName" runat="server" Text="Brand Name"></asp:Label>
                            <asp:Label ID="lblModelName" runat="server" Text="Model Name"></asp:Label>
						</li>
						<li class="col-md-6">
							<h6>City</h6>
                            <asp:Label ID="lblCityName" runat="server" Text="City Name"></asp:Label>
						</li>
                        <li class="col-md-6">
							<h6>Driver License Number</h6>
                            <asp:Label ID="lblLicense" runat="server" Text="License No"></asp:Label> <br />
						</li>
                        <li class="col-md-6">
							<h6>Car Delivery Address</h6>
                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
						</li>
						<li class="col-md-12">
							<h6>Total</h6>
                            <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
						</li>
						
						<li class="col-md-12">
							<h6>Additional Information</h6>
							<p>	Please keep your original Driving License handy. While delivering the car to you, our executive will verify your original Driving License and ID proof. This verification is mandatory. In the unfortunate case where you cannot show these documents, we will not be able to handover the car to you.</p>
						</li>
					</ul>
					<hr>
					<div class="contect_btn contect_btn_contact">
						<%--<ul>
							<li><a href="#">Print Order <i class="fa fa-print"></i></a>
							</li>
						</ul>--%>
                        <asp:Button ID="btnHome" CssClass="btn btn-primary" runat="server" Text="Home" 
                            onclick="btnHome_Click"  />
                        <asp:Button ID="btnBookingHistory" runat="server" CssClass="btn btn-primary" 
                            Text="Booking History" onclick="btnBookingHistory_Click" />
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>

