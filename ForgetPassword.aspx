<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="Client_ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Forget Password</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Forget Password</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
                                <li><a href="SignIn.aspx">Sign In</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Forget Password</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->
    <!-- xs offer car tabs Start -->
	<div class="x_partner_main_wrapper float_left">
		<div class="container">
			<div class="row">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                    <!-- login_wrapper -->
                    <div class="login_wrapper">
                        <div class="row">
                            <div class="col-md-12">
					            <div class="x_offer_car_heading_wrapper float_left">
						            <h3 id="heading" runat="server">Forget Password</h3><br /><br />
					            </div>
				            </div>
                        </div>
                        <asp:Panel ID="Panel1" runat="server">
                            <div class="formsix-pos">
                                <div class="form-group i-email">
                                    <asp:TextBox type="text" class="form-control" ID="txtUname" runat="server" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" 
                                        ControlToValidate="txtUname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                            <div class="formsix-e">
                                <div class="form-group i-password">
                                    <asp:TextBox type="email" class="form-control" ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email Required" 
                                        ControlToValidate="txtEmail" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ErrorMessage="Invalid Email ID" ControlToValidate="txtEmail"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            
                            <div class="login_btn_wrapper" style="border-bottom: 0px; margin-bottom:0px"> 
                                <asp:Button Cssclass="btn btn-primary col-12 login_btn" ID="btnNext" 
                                    runat="server" Text="Next" onclick="btnNext_Click"    />
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                             <div class="formsix-e">
                                <div class="form-group i-password">
                                    <asp:TextBox type="text" class="form-control" ID="txtOTP" runat="server" placeholder="OTP"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="login_btn_wrapper" style="border-bottom: 0px; margin-bottom:0px"> 
                                <asp:Button Cssclass="btn btn-primary col-12 login_btn" ID="btnNext1" 
                                    runat="server" Text="Next" onclick="btnNext1_Click"    />
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="Panel3" runat="server" Visible="false">
                            <div class="formsix-pos">
                                <div class="form-group i-email">
                                    <asp:TextBox type="password" class="form-control" ID="txtNewPwd" runat="server" MaxLength="50" placeholder="New Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="New Password Required" 
                                        ControlToValidate="txtNewPwd" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                        ErrorMessage="Password length must be between 8 to 50 characters(Without Whitespace)" ControlToValidate="txtNewPwd"
                                        SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic" ValidationExpression="^[\S]{8,50}$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            
                            <div class="formsix-e">
                                <div class="form-group i-password">
                                    <asp:TextBox type="password" class="form-control" ID="txtCNewPassword" runat="server" MaxLength="50" placeholder="Confirm New Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm New Password Required" 
                                        ControlToValidate="txtCNewPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch!"
                                        ControlToValidate="txtCNewPassword" ControlToCompare="txtNewPwd" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>

                            <div class="login_btn_wrapper" style="border-bottom: 0px; margin-bottom:0px"> 
                                <asp:Button Cssclass="btn btn-primary col-12 login_btn" ID="btnChangePwd" 
                                    runat="server" Text="Change Password" onclick="btnChangePwd_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                    <!-- /login_wrapper-->
                </div>
            </div>
		</div>
	</div>
</asp:Content>

