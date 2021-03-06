
### 查看某目录下的商品：get /category/{categoryId}/commodity

入参：路径里，{categoryId}，商品目录ID   
出参：如下
``` json

{
    "status": 0,
    "message": "success",
    "data": [
        {
            "id": 1,
            "categoryId": 1,
            "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
            "sellPoint": "送品牌烤箱，五一大促",
            "desc": [
                "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
            ],
            "price": 3299,
            "num": 99,
            "barcode": null,
            "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
            "status": 0,
            "weight": 43000,
            "colour": "银色",
            "size": "895*1775*690(mm)"
        },
        {
            "id": 3,
            "categoryId": 1,
            "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
            "sellPoint": "送品牌烤箱，五一大促",
            "desc": [
                "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
            ],
            "price": 3299,
            "num": 100,
            "barcode": null,
            "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
            "status": 0,
            "weight": 43000,
            "colour": "银色",
            "size": "895*1775*690(mm)"
        },
        {
            "id": 4,
            "categoryId": 1,
            "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
            "sellPoint": "送品牌烤箱，五一大促",
            "desc": [
                "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
            ],
            "price": 3299,
            "num": 98,
            "barcode": null,
            "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
            "status": 0,
            "weight": 43000,
            "colour": "白色",
            "size": "895*1775*690(mm)"
        },
        {
            "id": 5,
            "categoryId": 1,
            "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
            "sellPoint": "送品牌烤箱，五一大促",
            "desc": [
                "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
            ],
            "price": 3299,
            "num": 100,
            "barcode": null,
            "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
            "status": 0,
            "weight": 43000,
            "colour": "黑色",
            "size": "895*1775*690(mm)"
        }
    ]
}
```

### 查看目录下拉列表: get /category/all

入参：无  
出参：如下

``` json
{
    "status": 0,
    "message": "success",
    "data": [
        {
            "id": 1,
            "name": "家用电器"
        },
        {
            "id": 2,
            "name": "数码3C"
        },
        {
            "id": 3,
            "name": "服装鞋子"
        },
        {
            "id": 4,
            "name": "食品生鲜"
        },
        {
            "id": 5,
            "name": "酒水饮料"
        },
        {
            "id": 6,
            "name": "图书文具"
        },
        {
            "id": 7,
            "name": "医药保健"
        }
    ]
}

```

### 添加商品 post /manager/commodity

入参：表单上传，如下，//前缀为非必选  
``` 
categoryId:1（下拉列表选择的形式）
title:添加测试商品
//sellPoint:添加测试商品
price:33.33
num:99
//weight:200.00
//size:895*1775*690(mm)
//color:白色
//commodity_img：商品图片
//desc_img：商品详细描述图片
```

出参：如下
``` json
{
    "status": 0,
    "message": "success",
    "data": {
        "id": 45,
        "categoryId": 1,
        "title": "添加测试商品",
        "sellPoint": "添加测试商品",
        "desc": [
            "http://www.liaofushen.xyz:8080/imghub/b98001b8-ef8a-4c7f-bd11-9ef4f6930ff2.jpg"
        ],
        "price": 33.33,
        "num": 99,
        "barcode": null,
        "image": "http://www.liaofushen.xyz:8080/imghub/4e6933c8-9b3f-407a-b2e2-4b72c153b11d.jpg",
        "status": 0,
        "weight": 200,
        "colour": null,
        "size": "895*1775*690(mm)"
    }
}
```


### 购物车页面的推荐商品 get /commodity/recommend/incart  

入参：无

出参：

为{string，list<commodity>}对象的数组,  
对象的字段：  
recommendReason：推荐原因    
recommendList：这个推荐原因下有以下商品  

如下

``` json
{
    "status": 0,
    "message": "success",
    "data": [
        {
            "recommendReason": "购买了‘Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用’的用户也购买了下列商品",
            "recommendList": [
                {
                    "id": 1,
                    "categoryId": 1,
                    "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
                    "sellPoint": "送品牌烤箱，五一大促",
                    "desc": [
                        "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
                    ],
                    "price": 3299,
                    "num": 99,
                    "barcode": null,
                    "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
                    "status": 0,
                    "weight": 43000,
                    "colour": "银色",
                    "size": "895*1775*690(mm)"
                },
                {
                    "id": 3,
                    "categoryId": 1,
                    "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
                    "sellPoint": "送品牌烤箱，五一大促",
                    "desc": [
                        "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
                    ],
                    "price": 3299,
                    "num": 100,
                    "barcode": null,
                    "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
                    "status": 0,
                    "weight": 43000,
                    "colour": "银色",
                    "size": "895*1775*690(mm)"
                }
            ]
        },        {
            "recommendReason": "购买了‘Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用’的用户也购买了下列商品",
            "recommendList": [
                {
                    "id": 1,
                    "categoryId": 1,
                    "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
                    "sellPoint": "送品牌烤箱，五一大促",
                    "desc": [
                        "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
                    ],
                    "price": 3299,
                    "num": 99,
                    "barcode": null,
                    "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
                    "status": 0,
                    "weight": 43000,
                    "colour": "银色",
                    "size": "895*1775*690(mm)"
                },
                {
                    "id": 3,
                    "categoryId": 1,
                    "title": "Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用",
                    "sellPoint": "送品牌烤箱，五一大促",
                    "desc": [
                        "http://www.liaofushen.xyz:8081/images/1-desc1.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc2.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc3.jpg",
                        "http://www.liaofushen.xyz:8081/images/1-desc4.jpg"
                    ],
                    "price": 3299,
                    "num": 100,
                    "barcode": null,
                    "image": "http://www.liaofushen.xyz:8081/images/1-image.jpg",
                    "status": 0,
                    "weight": 43000,
                    "colour": "银色",
                    "size": "895*1775*690(mm)"
                }
            ]
        },
    ]
}

```