<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="Client_SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Sign In</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- btc tittle Wrapper Start -->
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Sign In</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Sign In</li>
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
						            <h3>LOGIN TO YOUR ACCOUNT</h3><br /><br />
					            </div>
				            </div>
                        </div>
                        <div class="formsix-pos">
                            <div class="form-group i-email">
                                <asp:TextBox type="text" class="form-control" ID="txtUname" runat="server" placeholder="Username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" 
                                ControlToValidate="txtUname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="formsix-e">
                            <div class="form-group i-password">
                                <asp:TextBox type="password" class="form-control" ID="txtPassword" runat="server" placeholder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" 
                                ControlToValidate="txtPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="login_remember_box">
                            <asp:HyperLink class="forget_password" NavigateUrl="~/Client/ForgetPassword.aspx" ID="ForgetPwd" runat="server" ForeColor="#4F5DEC">
                                Forget Password?
                            </asp:HyperLink>
                            <br />
                        </div>
                        <div class="login_btn_wrapper">
                            <asp:Button Cssclass="btn btn-primary col-12 login_btn" ID="btnSignIn" 
                                runat="server" Text="Sign In" onclick="btnSignIn_Click"  />
                        </div>
                        <div class="login_message">
                            <p>Don’t have an account ? <a href="SignUp.aspx"> Sign Up </a> </p>
                        </div>
                    </div>
                    <!-- /login_wrapper-->
                </div>
            </div>
		</div>
	</div>
</asp:Content>

