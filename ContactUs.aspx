<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Client_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Contact Us</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Contact Us</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Contact Us</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->

    <!-- xs offer car tabs Start -->
	<div class="x_contact_title_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>Contact Info</h3>
						<p>Team CarTravel always ready to help their customer.
                            <br />So, you can contact us with different way.
                        </p>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 full_width">
					<div class="x_contact_title_icon_cont_main_box">
						<div class="x_contact_title_icon">	<i class="fa fa-map-marker"></i>
						</div>
						<div class="x_contact_title_icon_cont">
							<h3><a href="#">address</a></h3>
							<p>420, Platinum Plaza, Vesu, Surat.</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 full_width">
					<div class="x_contact_title_icon_cont_main_box">
						<div class="x_contact_title_icon">	<i class="flaticon-phone-call"></i>
						</div>
						<div class="x_contact_title_icon_cont">
							<h3><a href="#">phone Number</a></h3>
							<p>1800 123 1234</p>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 full_width">
					<div class="x_contact_title_icon_cont_main_box">
						<div class="x_contact_title_icon">	<i class="flaticon-mail-send"></i>
						</div>
						<div class="x_contact_title_icon_cont">
							<h3><a href="#">Email Address</a></h3>
							<p><a href="#">cartravel2501@gmail.com</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    

    <div class="x_contact_title_main_wrapper float_left">
		<div class="container">
			<div class="row">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4895.912490097586!2d72.77826154209508!3d21.14686009490855!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x672dfe4f512e4d87!2sSDJ%20International%20College!5e0!3m2!1sen!2sin!4v1588453195100!5m2!1sen!2sin" height="450" class="w-100" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>    
			</div>
            <br />
		</div>
	</div>

    <!-- xs offer car tabs Start -->
	<div class="x_contact_title_main_wrapper float_left padding_tb_60">
		<div class="container">
			    <div class="row">
                    <div class="login_wrapper" style="margin-top: 0px">
                        <div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper x_offer_car_heading_wrapper_contact float_left">
						<h3>Leave A Message</h3>
						<p>Leave Your Message For Us. We Will Try To Keep In Touch With You As Soon As Possible.</p>
					</div>
				</div>
				<div class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Name Required" 
                        ControlToValidate="txtFname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtFname" CssClass="form-control" placeholder="First Name" runat="server"></asp:TextBox>
                        <br />
					</div>
				</div>
				<div class="col-xl-5 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last Name Required" 
                        ControlToValidate="txtLname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtLname" CssClass="form-control" placeholder="Last Name" runat="server"></asp:TextBox>
                        <br />
					</div>
				</div>
				<div class="col-xl-5 offset-xl-1 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email Required" 
                            ControlToValidate="txtEmail" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="Invalid Email ID" ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email ID" type="email" runat="server"></asp:TextBox>
                        <br />
					</div>
				</div>
				<div class="col-xl-5 col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Mobile Number Required" 
                            ControlToValidate="txtMobile" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobile"
                        ErrorMessage="Invalid Mobile Number" ValidationExpression="^([6-9]{1})([0-9]{9})$"
                        SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>        
                        <asp:TextBox ID="txtMobile" CssClass="form-control" placeholder="Mobile No" runat="server" MaxLength="10"></asp:TextBox>
                        <br />
					</div>
				</div>
				<div class="col-xl-10 offset-xl-1 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your Message" 
                            ControlToValidate="txtMsg" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtMsg" CssClass="form-control"  placeholder="Write Your Message"  runat="server" TextMode="MultiLine" Height="200px"></asp:TextBox>
                        <br />
					</div>
				</div>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="contect_btn contect_btn_contact">
                        <asp:Button ID="btnSendMsg" CssClass="btn btn-primary" runat="server" Text="Send Message" 
                            onclick="btnSendMsg_Click" />
					</div>
				</div>
                </div>   
                </div>
			</div>
            <br />
		</div>
	</div>
</asp:Content>

