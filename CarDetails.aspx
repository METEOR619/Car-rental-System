<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="CarDetails.aspx.cs" Inherits="Client_CarDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Car Details</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Car Details</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i></li>
                                <li><a href="CarList.aspx">Car List</a>  <i class="fa fa-angle-right"></i></li>
								<li>Car Details</li>	
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->
    
	<!-- x car book sidebar section Wrapper Start -->
  
        <div class="x_about_seg_main_wrapper float_left padding_tb_100">
		    <div class="container">
			    <div class="row">
                    <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
				        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <table style="height: 100%">
                                <tbody>
                                    <tr>
                                        <td class="align-middle">
                                            <div class="x_about_seg_img_wrapper float_left">
						                        <img src='../Admin/assets/images/CarModel/<%#Eval("ModelImage") %>' alt="img">
					                        </div>   
                                        </td>
                                    </tr>
                                </tbody> 
                            </table>
                        </div>
				    
				        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					        <div class="x_about_seg_img_cont_wrapper_details float_left">
						        <h3><%#Eval("BrandName") %> &nbsp;<%#Eval("ModelName") %></h3>

                                <div class="x_about_seg_img_cont_wrapper_details float_left">
                                    <td class="align-bottom"><h1>&#8377; <%#Eval("Price") %><span>/Day</span></h1></td>
                                </div>

                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <td>Seats</td>
                                            <td><%#Eval("Seats") %></td>
                                        </tr>
                                
                                        <tr>
                                            <td>Bag Space</td>
                                            <td><%#Eval("BagSpace") %></td>
                                        </tr>

                                        <tr>
                                            <td>Air Condition</td>
                                            <td><%#Eval("AirCondition") %></td>
                                        </tr>
                                    
                                        <tr>
                                            <td>Air Bag</td>
                                            <td><%#Eval("AirBag") %></td>
                                        </tr>
                                    
                                        <tr>
                                            <td>Gear Type</td>
                                            <td><%#Eval("GearType") %></td>
                                        </tr>
                                    
                                        <tr>
                                            <td>Fuel Type</td>
                                            <td><%#Eval("FuelType") %></td>
                                        </tr>

                                    </tbody>
                                </table>
                                <br />

                                <div class="row">
                                    <ul>
                                        <li><a href='Booking.aspx?MDetailsID=<%#Eval("MDetailsID") %>'>Check Out</a>
                                        </li>
                                    </ul>
                                    
                                    <%--<asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn btn-primary" />--%>
                                </div>
                            </div>
				        </div>
                    </ItemTemplate> 
                    </asp:ListView>
			    </div>
		    </div>
	    </div>
    
	<!-- x car book sidebar section Wrapper End -->

    <div class="x_about_seg_main_wrapper x_about_seg_important_details float_left">
		<div class="container">
			<div class="row">
				<div class="col-12">
                    <div class="x_about_seg_important_details">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2" align="center"><h2>Important Points To Remember</h2></th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td width="30%">Fuel</td>
                                    <td>Fuel Price is Excluded</td>
                                </tr>

                                <tr>
                                    <td>Tolls & Parking Charge</td>
                                    <td>All Types of Parking Charge Paid by you</td>
                                </tr>

                                <tr>
                                    <td>ID Verification</td>
                                    <td>Please keep your original Driving License handy. While delivering the car to you, our executive will verify your original 
                                    Driving License and ID proof. This verification is mandatory. In the unfortunate case where you cannot show these documents, 
                                    we will not be able to handover the car to you
                                    </td>
                                </tr>
                            </tbody>             
                        </table>
                    </div>                        
                </div>
			</div>
		</div>
	</div>
</asp:Content>

