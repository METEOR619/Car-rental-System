<%@ Page Title="" Language="C#" MasterPageFile="~/Client/ClientMaster.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="Client_SignUp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Sign Up</title>
    <script type="text/javascript">
        function pageLoad() {
            $(function () {
                $("#<%= txtDOB.ClientID %>").datepicker({
                    format: "dd/mm/yyyy",
                    maxViewMode: 3,
                    startDate: "01-01-1900",
                    endDate: "-18y",
                    autoclose: true
                });
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <title>Sign Up</title>
	<!-- btc tittle Wrapper Start -->
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
	<div class="btc_tittle_main_wrapper">
		<div class="btc_tittle_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_left_heading">
						<h1>Sign Up</h1>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 full_width">
					<div class="btc_tittle_right_heading">
						<div class="btc_tittle_right_cont_wrapper">
							<ul>
								<li><a href="Home.aspx">Home</a>  <i class="fa fa-angle-right"></i>
								</li>
								<li>Sign Up</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- btc tittle Wrapper End -->
	<!-- xs offer car tabs Start -->
	<div class="x_partner_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper float_left">
						<h3>NEW CUSTOMER SIGN UP HERE</h3>
					</div>
				</div>
			</div>
			<div class="row">
                <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                    <!-- login_wrapper -->

                    <div class="register_wrapper_box">
                        <div class="register_left_form">

                            <div class="row clearfix">
                               
                                <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username Required" 
                                    ControlToValidate="txtUname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox type="text" name="field-name" value="" ID="txtUname" runat="server" placeholder="Username"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" 
                                    ControlToValidate="txtPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ErrorMessage="Password length must be between 8 to 50 characters(Without Whitespace)" ControlToValidate="txtPassword"
                                    SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic" ValidationExpression="^[\S]{8,50}$"></asp:RegularExpressionValidator>
                                    <asp:TextBox type="password" name="field-name" value="" ID="txtPassword" 
                                        runat="server" placeholder="Password" MaxLength="50"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password Required" 
                                    ControlToValidate="txtCPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Mismatch!"
                                    ControlToValidate="txtCPassword" ControlToCompare="txtPassword" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:CompareValidator>
                                    <asp:TextBox type="password" name="field-name" value=""  ID="txtCPassword" 
                                        runat="server" placeholder="Confirm Password" MaxLength="50"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Name Required" 
                                    ControlToValidate="txtFname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox type="text" name="field-name" value="" ID="txtFname" runat="server" placeholder="First Name"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last Name Required" 
                                    ControlToValidate="txtLname" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox type="text" name="field-name" value="" ID="txtLname" runat="server" placeholder="Last Name"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email Required" 
                                    ControlToValidate="txtEmail" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ErrorMessage="Invalid Email ID" ControlToValidate="txtEmail"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:TextBox type="email" name="field-name" value="" ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Mobile Number Required" 
                                    ControlToValidate="txtMobNo" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMobNo"
                                    ErrorMessage="Invalid Mobile Number" ValidationExpression="^([6-9]{1})([0-9]{9})$"
                                    SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:TextBox type="text" name="field-name" value="" ID="txtMobNo" runat="server" placeholder="Mobile number" MaxLength="10"></asp:TextBox>
                                </div>
                                
                                <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Date of Birth Required" 
                                    ControlToValidate="txtDOB" SetFocusOnError="True" CssClass="alert alert-danger p-1" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtDOB" runat="server" placeholder="DOB"></asp:TextBox>
                                </div>
                            </div>
                              
                            <div class="login_btn_wrapper register_btn_wrapper register_wrapper_btn">
                                <asp:Button class="btn btn-primary col-12 " ID="btnNext" runat="server" 
                                    Text="Next" onclick="btnNext_Click"  />
                            </div>

                            <asp:Panel ID="pnOTP" runat="server" Visible="false">
                                <div class="row clearfix">
                                    <div class="form-group col-md-12 col-sm-6 col-xs-12">
                                        <asp:TextBox type="text" name="field-name" value="" ID="txtOTP" runat="server" placeholder="OTP"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="login_btn_wrapper register_btn_wrapper register_wrapper_btn">
                                    <asp:Button class="btn btn-primary col-12 " ID="btnSignUp" runat="server" 
                                        Text="Sign Up" onclick="btnSignUp_Click" />
                                </div>
                            </asp:Panel>
                            
                            <div class="login_message">
                                <p>Already a member? <a href="SignIn.aspx"> Sign In </a> </p>
                            </div>
                        </div>
                    </div>
                    <!-- /.login_wrapper-->
                </div>
            </div>
		</div>
	</div>
</asp:Content>

