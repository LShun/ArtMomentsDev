﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="ArtMoments.Sites.artist.OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th,td{
            border: 1px solid black;
        }
        .auto-style1 {
            height: 24px;
            width: 132px;
        }
        .auto-style2 {
            height: 25px;
            width: 229px;         
        }
        .auto-style3 {
            width: 229px;
        }
        .auto-style4 {
            height: 24px;
            width: 229px;
        }
        .auto-style5 {
            width: 1469px;
        }
        .auto-style6 {
            height: 25px;
            width: 218px;
        }
        .auto-style7 {
            width: 218px;
        }
        .auto-style8 {
            height: 24px;
            width: 218px;
        }
        .auto-style9 {
            height: 25px;
            width: 107px;
        }
        .auto-style10 {
            width: 107px;
        }
        .auto-style11 {
            height: 24px;
            width: 107px;
        }
        .auto-style12 {
            height: 25px;
            width: 669px;
        }
        .auto-style13 {
            width: 669px;
        }
        .auto-style14 {
            height: 24px;
        }
        .auto-style15 {
            height: 25px;
            width: 181px;
        }
        .auto-style16 {
            width: 181px;
        }
        .auto-style17 {
            height: 24px;
            width: 181px;
        }
        .auto-style18 {
            height: 25px;
            width: 135px;
        }
        .auto-style19 {
            width: 135px;
        }
        .auto-style20 {
            height: 24px;
            width: 135px;
        }
        .auto-style21 {
            height: 25px;
            width: 251px;
        }
        .auto-style22 {
            width: 251px;
        }
        .auto-style23 {
            height: 24px;
            width: 251px;
        }
        .auto-style24 {
            height: 25px;
            width: 132px;
        }
        .auto-style25 {
            width: 132px;
        }
        #searchinput {
        background-image: url('../../Content/search--v2.png'); /* Add a search icon to input */
        background-position: 10px 10px; /* position the search icon */
        background-repeat: no-repeat; /* do not repeat the icon image */
        background-size: 25px 25px; /*adjust background image size*/
        width: 50%; /* half-width */
        font-size: 16px; /* increase font-size */
        padding: 12px 20px 12px 40px; /* add some padding */
        border: 1px solid #ddd; /* add a grey border */
        margin-bottom: 12px; /* add some space below the input */
		}
        #dropdownlist1{
            font-weight: bold;
            width:218px;
        }

        th {
            cursor: pointer;
        }
        .auto-style26 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style5">
			<h1>Artwork Order</h1>
			</br>

			<input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search for Artwork names.."/>
            <table id="orderTable" class="orderListTable" style="border:1px solid black">
				<thead>
					<tr>
						<th class="auto-style9" onclick="sortOrderTable(0)">Order ID</th>
						<th class="auto-style12" onclick="sortOrderTable(1)">Artwork Name</th>
						<th class="auto-style15" onclick="sortOrderTable(2)">Category</th>
						<th class="auto-style18" onclick="sortOrderTableNum(3)">Order Total</th>
                        <th class="auto-style18" onclick="sortOrderTableNum(4)">Subtotal(RM)</th>
						<th class="auto-style21" onclick="sortOrderTable(5)">Customer</th>
						<th class="auto-style24">
                            <asp:DropDownList ID="ddlStatus" runat="server" Font-Bold="True" CssClass="auto-style26" Height="34px" Width="132px" onchange = "filterStatusFunction()">
                                <asp:ListItem>Status</asp:ListItem>
                                <asp:ListItem>Pending</asp:ListItem>
                                <asp:ListItem>Delivering</asp:ListItem>
                                <asp:ListItem>Completed</asp:ListItem>
                                <asp:ListItem>Canceled</asp:ListItem>
                            </asp:DropDownList>
                        </th>
						<th class="auto-style6"><asp:DropDownList ID="ddlDelivery" runat="server" Font-Bold="True" Height="34px" Width="218px" onchange = "filterDeliveryFunction()">
                            <asp:ListItem>Delivery Channels</asp:ListItem>
                            <asp:ListItem>Ninja Van</asp:ListItem>
                            <asp:ListItem>Pos Laju</asp:ListItem>
                            <asp:ListItem>FedEx</asp:ListItem>
                            <asp:ListItem>J&T express</asp:ListItem>
                            <asp:ListItem>GD Express</asp:ListItem>
                            <asp:ListItem>City-Link Express</asp:ListItem>
                            <asp:ListItem>DHL</asp:ListItem>
                            </asp:DropDownList>
                        </th>
						<th class="auto-style2">Date Order</th>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td class="auto-style10">S100007</td>
					<td class="auto-style13">My Elephant Friend</td>
					<td class="auto-style16">Prints</td>
					<td class="auto-style19">1</td>
                    <td class="auto-style19">540.00</td>
					<td class="auto-style22">Loong Yi Ren</td>
					<td class="auto-style25">Completed</td>
					<td class="auto-style7">Ninja Van</td>
					<td class="auto-style3">2/1/2021</td>
			</tr>
			<tr>
					<td class="auto-style11">S100002</td>
					<td class="auto-style14">Tetons and The Snake River, Grand Teton National Park</td>
					<td class="auto-style17">Photography</td>
					<td class="auto-style20">2</td>
                    <td class="auto-style19">178.00</td>
					<td class="auto-style23">Tan Xue Ern</td>
					<td class="auto-style1">Delivering</td>
					<td class="auto-style8">Pos Laju</td>
					<td class="auto-style4">21/1/2021</td>
			</tr>
			<tr>
					<td class="auto-style10">S100001</td>
					<td class="auto-style13">SPHÉROÏDE ARDOISÉE</td>
					<td class="auto-style16">Sculpture</td>
					<td class="auto-style19">1</td>
                    <td class="auto-style19">9028.29</td>
					<td class="auto-style22">Ang Chun Kit</td>
					<td class="auto-style25">Pending</td>
					<td class="auto-style7">Ninja Van</td>
					<td class="auto-style3">31/1/2021</td>
			</tr>
		</tbody>
		
	</table>
        </div>
    <script>
        function sortOrderTable(n) {
            var table, rows, swap, i, x, y, shouldSwap, dir, switchcount = 0;
            table = document.getElementById("orderTable");
            swap = true;
            dir = "asc";                  //Set the direction of sorting to ascending:

            //loop continue until no swap has been done:
            while (swap) {
                swap = false;
                rows = table.rows;

                //Loop through all table rows except the table headers
                for (i = 1; i < (rows.length - 1); i++) {      
                    shouldSwap = false;

                    //Get two elements, one from current row and one from the next:*/
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];

                    //*check if the two rows should switch place, based on the direction, asc or desc:*/
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwap = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwap = true;
                            break;
                        }
                    }
                }
                if (shouldSwap) {
                    //swap
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    swap = true;
                    //Each time a switch is done, increase this count by 1:
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        swap = true;
                    }
                }
            }
        }
        function sortOrderTableNum(n) {
            var table, rows, swap, i, x, y, shouldSwap, dir, switchcount = 0;
            table = document.getElementById("orderTable");
            swap = true;
            dir = "asc";                  //Set the direction of sorting to ascending:

            //loop continue until no swap has been done:
            while (swap) {
                swap = false;
                rows = table.rows;

                //Loop through all table rows except the table headers
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwap = false;

                    //Get two elements, one from current row and one from the next:*/
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];

                    //*check if the two rows should switch place, based on the direction, asc or desc:*/
                    if (dir == "asc") {
                        if (Number(x.innerHTML) > Number(y.innerHTML)) {
                            shouldSwap = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (Number(x.innerHTML) < Number(y.innerHTML)) {
                            shouldSwap = true;
                            break;
                        }
                    }
                }
                if (shouldSwap) {
                    //swap
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    swap = true;
                    //Each time a switch is done, increase this count by 1:
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        swap = true;
                    }
                }
            }
        }

        function searchFunction() {
            var input, filter, table, tr, td, i, textValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("orderTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    textValue = td.textContent || td.innerText;
                    if (textValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function filterDeliveryFunction() {
            var filterValue, table, tr, td, i, textValue;
            var originalText = "Delivery Channels";
            filterValue = document.getElementById("ddlDelivery").value;
            table = document.getElementById("orderTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[6];
                if (td) {
                    textValue = td.innerText;
                    if (originalText.localeCompare(filterValue) == 0) {
                        tr[i].style.display = "";
                    }
                    else if (textValue.localeCompare(filterValue) == 0) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function filterStatusFunction() {
            var filterValue, table, tr, td, i, textValue;
            var originalText = "Status";
            filterValue = document.getElementById("ddlStatus").value;
            table = document.getElementById("orderTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5];
                if (td) {
                    textValue = td.innerText;
                    if (originalText.localeCompare(filterValue) == 0) {
                        tr[i].style.display = "";
                    }
                    else if (textValue.localeCompare(filterValue) == 0) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</asp:Content>
