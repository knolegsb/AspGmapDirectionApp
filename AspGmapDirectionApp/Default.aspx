<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspGmapDirectionApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="//maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=abqiaaaaupsjpk3mbtdpj4g8cqbnjrragtyh6uml8madna0ykuwnna8vnxqczvbxtx2dyyxgstoxpwhvig7djw" type="text/javascript">
    </script>
    <script language="javascript">
        var Gmap;
        var directionPanel;
        var direction;
        function initialize() {
            Gmap = new GMap2(document.getElementById("map"));
            Gmap.setCenter(new GLatLng(33.8749588, -117.9659036), 15);

            directionPanel = document.getElementById("route");
            direction = new GDirections(Gmap, directionPanel);
        }
        $(document).ready(function () {
            initialize();
            $('#btnGetDirection').click(function () {
                pupulateDirection();
            });
        });

        function populateDirection() {
            var from = $('#<%=direcFrom.ClientID%>').val();
            var to = $('#<%=direcTo.ClientID%>').val();
            $.ajax({
                url: "Default.aspx/GetDirection",
                type: "post",
                data: "{from: '" + from + "', to: '" + to + "'}",
                datatype: "json",
                contenttype: "application/json; charset=utf-8",
                success: function (data) {
                    direction.load(data.d.toString());
                },
                error: function () {
                    alert("error!");
                }
            });
        }
    </script>                                                                                                                                                                                                          
    <h3>Get GMap direction from database using ASP.NET</h3>
    <br />
    <table>
        <tr>
            <td>From : </td>
            <td>
                <asp:DropDownList ID="direcFrom" runat="server"></asp:DropDownList>
            </td>
            <td>To : </td>
            <td>
                <asp:DropDownList ID="direcTo" runat="server"></asp:DropDownList>
            </td>
            <td>
                <input type="button" value="Get Direction" id="btnGetDirection" />
            </td>
        </tr>
    </table>
    <br />
    <div id="map" style="width:50%; height:300px; border:solid 1px black; float:left"></div>
    <div id="route" style="width:30%; height:300px; border:solid 1px black; float:left; overflow:auto"></div> 
</asp:Content>
