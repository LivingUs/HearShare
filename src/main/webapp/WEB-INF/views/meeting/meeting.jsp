<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
</head>
<style>
    #item {
        margin: 20px 47px;
    }

    #item_img {
        width: 200px;
        height: 200px;
    }

    #item_img:hover {
        transition-duration: 0.5s;
        transform: scale(0.95);
    }

    #item_title {
        margin-top: 5px;
    }

    #item_price {
        margin-top: 5px;
        margin-bottom: 10px;
        font-size: 13px;
        color: gray;
    }

    #item_discount {
        font-size: 14px;
    }    
</style>
<body>
<br>
<header>
<h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;모임하기</h3>
    <nav id="smallnav">
        <a href="#write" class="icon far fa-heart"></a>
        <a href="#meeting" class="icon far fa-heart"></a>
        <a href="#place" class="icon far fa-heart"></a>
        <a href="#" class="icon far fa-heart"></a>
    </nav>
<hr>
</header>

    <!-- <div id="buttonM" style="position: relative; bottom: 80px;">
    <button id="continue" class="btn btn-dark">진행중인 모임</button>
	<button id="insert" class="btn btn-dark">참가중인 모임</button>
	</div>-->
    <section>
        <table style="border: 1px solid black;">
                <td>
                    <a href="/select/Shop?productNo=${shop.productNo }">
                        <div id="item">
                            <div id="item_img">
                                <img src="${shop.img}">
                            </div>
                            <div id="item_title">
                                ${shop.productName }
                            </div>
                            <hr>
                            <div id="item_price">
                                <del>${shop.price}원</del>
                            </div>
                            <div id="item_discount">
                                ${shop.discount}원
                            </div>
                        </div>
                    </a>
                </td>
            </table>
    </section>
</body></html>