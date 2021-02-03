<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/General.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ArtMoments.Sites.artist.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1138px;
            border:1px solid black;
            cursor: default;
        }
        .auto-style14 {
            width: 211px;
            border: 1px solid black;
            text-align: center;
        }
        .auto-style16 {
            width: 129px;
            border:1px solid black;
            text-align:center;
        }
        .auto-style17 {
            width: 310px;
            border: 1px solid black;
            text-align: center;
        }
        .auto-style18 {
            width: 275px;
            height: 245px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style22 {
            width: 2167px;
            height: 57px;
        }
        .auto-style23 {
            height: 57px;
            width: 233px;
        }
        th {
            cursor: pointer;
        }
        .auto-style26 {
            width: 1138px;
            border: 1px solid black;
            height: 257px;
        }
        .auto-style27 {
            width: 70px;
            height: 465px;
            border: 1px solid black;
        }

        #searchInput {
        background-image: url('../../Content/search--v2.png'); /* Add a search icon to input */
        background-position: 10px 10px; /* Position the search icon */
        background-repeat: no-repeat; /* Do not repeat the icon image */
        background-size: 25px 25px; /*adjust background image size*/
        width: 50%; /* Full-width */
        font-size: 16px; /* Increase font-size */
        padding: 12px 20px 12px 40px; /* Add some padding */
        border: 1px solid #ddd; /* Add a grey border */
        margin-bottom: 12px; /* Add some space below the input */
        }
        .auto-style28 {
            margin-right: 1px;
        }
        .auto-style29 {
            width: 70px;
            border: 1px solid black;
        }
        .auto-style30 {
            width: 158px;
            border: 1px solid black;
            text-align: center;
        }
        .auto-style31 {
            width: 134px;
            border: 1px solid black;
            text-align: center;
        }
        .auto-style32 {
            width: 233px;
        }
        .auto-style33 {
            width: 2167px;
        }
        .button {
            background-color: gray; /* Green */
            border: none;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .button1 {
            background-color: white; 
            color: black; 
            border: 2px solid gray;
}

        .button1:hover {
            background-color: gray;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style28">
        <table>
                <tr><td class="auto-style22"><h1>Artwork List</h1></td>
                    <td class="auto-style23">
                        <asp:Button ID="addProdBtn" class="button button1" runat="server" Text="Add a New Artwork" Height="43px" OnClick="addProdBtn_Click"/>
                    </td>
                    </tr>
                <tr><td class="auto-style33"></td><td class="auto-style32"></td></tr>
         </table>
        <%--<nav aria-label="...">
            <ul class="pagination">
                <li class="page-item disabled">
                   <span class="page-link">Previous</span>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active">
                 <span class="page-link">
                       2
                       <span class="sr-only">(current)</span>
                 </span>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                 <a class="page-link" href="#">Next</a>
                </li>
                </ul>
            </nav>--%>           
            
            <input type="text" id="searchInput" onkeyup="searchFunction()" placeholder="Search for Product names.." class="auto-style28"/>

            <table id="prodTable" class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th class="auto-style16" onclick="sortProdTable(0)">Product ID</th>
                    <th class="auto-style1">Product Name</th>
                    <th class="auto-style17" onclick="sortProdTable(2)">Product Category</th>
                    <%--<th class="th-product">Product Description</th>
                    <th class="th-product">Product Size</th>--%>
                    <th class="auto-style14" onclick="sortProdTableNum(3)">Price (RM)</th>
                    <th class="auto-style30" onclick="sortProdTableNum(4)">Stock</th>
                    <th class="auto-style31" onclick="sortProdTableNum(5)">Sales</th>
                    <th class="auto-style29">Action</th>
                </tr>
            </thead>
 
            <tbody>
                <tr>
                    <td  class="auto-style16">P000001</td>
                    <td class="auto-style26"><img src="../../Content/nancy-tillman-my-elephant-friend_u-l-q1awkyfo1zln.jpg" alt="" border="3" class="auto-style18"/>
                    </br> <strong>My Elephant Friend</strong> 
                     </br> Our canvas is professionally hand-stretched and layered with protective ink for a superior museum-grade finish. Its mirrored edges give it a reflection-like appearance.
                    </br></br> Size: 141cm x 141 cm  </br>
                    </td>
                    <td  class="auto-style17">Prints</td>
                    <td  class="auto-style14">540.00</td>
                    <td  class="auto-style30">80</td>
                    <td  class="auto-style31">8</td>
                    <td  class="auto-style27">
                        <asp:Button ID="editBtn1" class="button button1" runat="server" Text="Edit" Width="67px" />
                    </td>
                </tr>
                
                <tr>
                    <td  class="auto-style16">P000002</td>
                    <td class="auto-style26"><img src="../../Content/tetons-and-the-snake-river-grand-teton-national-park-c-1942_u-l-f3p8uj0.jpg" alt="" border="3" class="auto-style18"/>
                    </br> <strong>Tetons and The Snake River, Grand Teton National Park</strong> 
                     </br> Tetons and The Snake River by Ansel Adams is a black and white photograph of Snake River taken at Grand Teton National Park, Wyoming in 1942.
                    </br></br> Size: 135cm x 135 cm  </br>
                    </td>
                    <td  class="auto-style17">Photography</td>
                    <td  class="auto-style14">89.00</td>
                    <td  class="auto-style30">170</td>
                    <td  class="auto-style31">5</td>
                    <td  class="auto-style27">
                        <asp:Button ID="editBtn2" class="button button1" runat="server" Text="Edit" Width="67px" />
                    </td>
                </tr>

                <tr>
                    <td  class="auto-style16">P000003</td>
                    <td class="auto-style26"><img src="../../Content/14019785_00-129-spheroide-noire-01.jpg" alt="" border="3" class="auto-style18"/>
                    </br> <strong>SPHÉROÏDE ARDOISÉE</strong> 
                    </br> <p>Slate sculpture on Quartzite.</p>

                          <p>"Marc MUGNIER is the sculptor of nature. His works deliver the secrets of stone and wood and convey a message of peace and respect. The artist has succeeded in creating a real link with the material. No question of imposing a rigorous vision of his work, the sculptor gives free rein to everyone's imagination. "There is no particular message in my sculptures. The only thing I defend is respect for nature." "Article from Home and Garden Magazine</p>

                          <p>"The stone is charged with memory. It remembers the sky and the sea. The sculptor is someone who frees this material from its gravity, who brings to light what the night of time has obscured." Extract from "Marc" MUGNIER or the Pierre Qui Chante "by Michel LAGRANGE, poet</p>

                          <p>"Sculpture / Nature: Marc Mugnier is an artist of the material imagination, this recent conquest of Non-figuration. He nevertheless relies on archetypal forms, those which are deeply inscribed in the human psyche." Text by Jean- Clarence Lambert, art critic</p>
                    </br></br> Size: 25x25x25 cm  </br>
                    </td>
                    <td  class="auto-style17">Sculpture</td>
                    <td  class="auto-style14">9028.29</td>
                    <td  class="auto-style30">10</td>
                    <td  class="auto-style31">1</td>
                    <td  class="auto-style27">
                        <asp:Button ID="Button1" class="button button1" runat="server" Text="Edit" Width="63px" />
                    </td>
                </tr>
            </tbody>

            </table>
        </div>
    <script>
        function sortProdTable(n) {
            var table, rows, swap, i, x, y, shouldSwap, dir, switchcount = 0;
            table = document.getElementById("prodTable");
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

        function sortProdTableNum(n) {
            var table, rows, swap, i, x, y, shouldSwap, dir, switchcount = 0;
            table = document.getElementById("prodTable");
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
            table = document.getElementById("prodTable");
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
    </script>
</asp:Content>
