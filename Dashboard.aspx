<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <title>Dashboard</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row mt-3">
            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Car Brand</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblCarBrand" runat="server" Text="Car Brand"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Car Category</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblCarCategory" runat="server" Text="Car Category"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Car Model</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblCarModel" runat="server" Text="Car Model"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Admin</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblAdmin" runat="server" Text="Admin"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Users</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblUser" runat="server" Text="Users"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Booking</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblBooking" runat="server" Text="Booking"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">Income</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblPayment" runat="server" Text="Payment"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">State</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-6 col-xl-4">
                <div class="card">
                    <div class="card-body p-4">
                        <p class="mb-0"><span class="badge badge-primary">City</span></p>
                        <div class="text-center">
                            <h4 class="mb-0 p-3 text-primary">
                                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</asp:Content>

