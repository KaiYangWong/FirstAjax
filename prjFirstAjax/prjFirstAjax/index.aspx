<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prjFirstAjax.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>農村地方美食小吃特色料理</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var dataurl = "https://localhost:44372/ODwsvTravelFood.json";
            var tdata;   

            $.ajax({
                url: dataurl,       
                type: 'GET',  
                success: function (data) {  
                    tdata = data;
                    alert("農村地方美食小吃特色料理共" + data.length + "筆記錄");

                    //使用for迴圈讀出data陣列的值
                    for (var i = 0; i < data.length; i++) {
                        $("#divShow").append
                            (
                                "<div class='col-sm-4' style='margin-top:15px;'>" +
                                "<div class='img-thumbnail'>" +
                                "<img src='" + data[i].PicURL + "' style='width:100%;' class='rounded'>" +
                                "<div class='caption'>" +
                                "<h3>" + data[i].Name + "</h3>" +
                                "<p>" + data[i].Address + "</p>" +
                                "<input type='button' id='btn" + i +
                                "' class='btn btn-info' data-toggle='modal' data-target='#myModal' value='更多資訊'>" +
                                "</div>" +
                                "</div>" +
                                "</div>"
                            );
                        
                        $("#btn" + i).on("click", { index: i }, fnDetails);
                    }
                }
            });

            function fnDetails(event) {
                
                var index = event.data.index;
               
                $("#MName").html(tdata[index].Name);
                $("#HostWords").html("<img src='" + tdata[index].PicURL + "' style='width:100%;'><hr>" +
                    tdata[index].HostWords);
                $("#btnMap").html("<a href='https://www.google.com.tw/maps/place/" +
                    tdata[index].Address + " ' target='_blank' class='btn btn-success'>地圖</a>");
            }

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--製作巡覽列-->
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="index.aspx">農村地方美食小吃特色料理</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                </ul>
            </div>
        </nav>

        <!--製作容器-->
        <div class="container-fluid" style="margin-top: 30px;">

            <!--用來存放縮圖元件-->
            <div class="row" id="divShow">
            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="MName">標題</h4>
                        </div>
                        <div class="modal-body">
                            <p id="HostWords">圖與內文</p>
                        </div>
                        <div class="modal-footer">
                            <span id="btnMap">地圖連結鈕</span>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <hr />
            <!--製作頁尾-->
            <footer>
                <p>
                    &copy; 
                    <asp:Label ID="lblYear" runat="server"></asp:Label>- 大才全資訊科技股份有限公司
                </p>
            </footer>
        </div>
    </form>
</body>
</html>
