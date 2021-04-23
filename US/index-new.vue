<template>
    <!-- 首页外包 -->
    <div class="index-wrapper">
        <div
                class="sv-wrapper"
                :style="{ height: barHeight + 'px', 'line-height': barHeight + 'px' }"
        >
            晋快办
        </div>
        <!-- 用户信息外包 -->
        <div class="user-wrapper">
            <div class="user-info">
                <div v-show="isRepaired" class="repaired-wrap">
                    <div>
                        <span>{{ repairedNum }}</span>
                    </div>
                </div>
                <!-- 获取头像 -->
                <div class="head-img" @click="jumpToPerson()">
                    <!--<open-data type="userAvatarUrl"></open-data>-->
                    <img :src="avatarUrl" alt=""/>
                </div>
                <div class="login" @click="jumpToPerson()">
                    <!-- 获取昵称 -->
                    <div v-if="userName" class="user-name">{{ userName }}</div>
                    <!--<open-data type="userNickName" v-if="!userName"></open-data>-->
                    <div class="person-center">
            <span>个人中心</span
            ><img src="../../../static/images/arrow-s.png" alt=""/>
                    </div>
                    <!--<button v-if="!phone" open-type="getUserInfo" bindgetuserinfo="bindGetUserInfo">授权登录</button>-->
                    <!-- <button>请登录</button> -->
                </div>
                <!--<div :class="isScreen?'qr-code-screen':'qr-code'" @click="qrCodeImg?clickQrcode():''">-->
                <!--<img :src="qrCodeImg" alt/>-->
                <!--</div>-->
                <div class="office-zone" v-if="officeZone.length > 1">
                    <!--<div>请选择当前工作区</div>-->
                    <picker
                            @change="changeOfficeZone"
                            :value="officeZoneIdx"
                            :range="officeZone"
                            range-key="text"
                    >
                        <view class="picker">
                            <image
                                    class="location"
                                    src="../../static/images/location.png"
                            ></image>
                            <p class="ellipsis">{{ officeZone[officeZoneIdx].text }}</p>
                            <image
                                    class="arrow"
                                    src="../../static/images/bottom-arrow.png"
                            ></image>
                        </view>
                    </picker>
                </div>
            </div>
            <!-- 用户编号 -->
            <div class="user-noTel">
                <div v-if="employeenum && userType == 11">
                    <!--<div v-if="employeenum&&userType==11" @click="goSm">-->
                    <!-- <i class="no-img"></i> -->
                    <img :src="groupImg" alt/>
                    <span>{{ employeenum }}</span>
                </div>
                <!-- 用户手机号 -->
                <div v-if="telephone">
                    <!-- <i class="tel-img"></i> -->
                    <img :src="telImg" alt/>
                    <!--<span>189-7037-9052</span>-->
                    <span>{{ telephone }}</span>
                    <!--<button open-type="getPhoneNumber" @getphonenumber="getPhoneNumber">获取手机号</button>-->
                </div>
            </div>
        </div>
        <!-- 最近使用菜单按钮 -->
        <div id="menu-wrapper" class="menu-wrapper" v-if="menuData.length">
            <!-- <swiper @change="swiperChange">
                  <swiper-item>-->
            <h3>最近使用</h3>
            <ul class="clearfix">
                <li
                        v-for="(item, index) in menuData"
                        :key="index-new"
                        @click="navigateUrl(index-new, 'use')"
                >
                    <div :style="'background:' + item.iconBackground">
                        <img :src="item.recentImgUrl" alt/>
                    </div>
                    <p>{{ item.title }}</p>
                </li>
            </ul>
        </div>
        <!-- 导航栏 -->
        <div
                class="nav"
                :style="{
        height: barHeight + windowWidth * proportion + 'px;',
        'padding-top': barHeight - 21 + 'px;',
        top: topValue + 'px',
      }"
        >
            <h3>晋快办</h3>
            <div class="nav-wrapper">
                <div
                        :style="'transform:' + 'translateX(' + translateXNum + 'px' + ')'"
                        class="item"
                        @touchstart="touchStart"
                        @touchmove="touchmoveEvent"
                        @touchend="touchEnd"
                        @longpress="longpressEvent"
                >
                    <div
                            v-for="(item, index) in nav"
                            :key="index-new"
                            @click="tabClick(index-new)"
                            :class="[{ active_item: activeIndex === index-new }, 'nav_item']"
                            :style="'width:' + navWidth + 'px'"
                    >
                        {{ item }}
                        <!-- {{ activeIndex }} -->
                        <div
                                class="line-wrapper"
                                :style="'width:' + navWidth + 'px;' + ' height: 3px'"
                        >
                            <div
                                    v-show="activeIndex === index-new"
                                    :style="'width:' + navWidth * 0.4464285714 + 'px'"
                                    class="line"
                            ></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 常用服务菜单按钮-->
        <div id="service-wrapper" class="service-wrapper">
            <h3 id="common-services">常用服务</h3>
            <div
                    class="common-menu-wrapper"
                    v-for="(item1, index1) in serviceData"
                    :key="index1"
                    :id="'commonMenu' + index1"
            >
                <h4 class="h4">{{ item1.commonTitle }}</h4>
                <ul class="clearfix">
                    <!-- <navigator hover-class="none" url="/pages/development/main"> -->
                    <li
                            v-for="(item, index) in item1.commonMenu"
                            :key="index-new"
                            @click="navigateUrl(index-new, 'service', item1.commonMenu)"
                    >
                        <div style="display: flex; height: 100%">
                            <div class="service-icon">
                                <!-- <div :class="index % 2 === 0?'service-icon':''"> -->
                                <img :src="item.iconImgUrl" alt/>
                                <!-- <i v-if="index % 2 === 0" class="line"></i> -->
                            </div>
                            <div class="service-content">
                                <div class="service-content-wrapper">
                                    <h4>{{ item.title }}</h4>
                                    <p>{{ item.describe }}</p>
                                </div>
                            </div>
                        </div>
                        <i></i>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 底线组件 -->
        <BaseLine/>
    </div>
</template>

<script>
    // 导入搜索公共的组件
    import SearchBar from "../../components/search-bar";
    // 导入基线公共的组件
    import BaseLine from "../../components/BaseLine";
    //引入请求的URL集合
    import Service from "../../service/index";
    //引入请求接口函数
    import {get, postWWW, postJson, upload} from "../../service/http";

    export default {
        data() {
            return {
                nav: [
                    "消费服务",
                    "餐饮服务",
                    "出行服务",
                    "来访服务",
                    "会议管理",
                    "物业服务",
                    "便民服务",
                ],
                repairedNum: 0,
                isRepaired: false,
                translateXNum: 0,
                proportion: 0.13333333333333333,
                difference: 0,
                activeIndex: 0,
                navWidth: 0,
                windowWidth: 0,
                topValue: 0,
                avatarUrl: "",
                groupImg: require("../../../static/images/group.png"),
                telImg: require("../../../static/images/tel.png"),
                // fundImg: require("../../../static/images/fund (2).png"),
                // moreImg: require("../../../static/images/gift-fill.png"),
                officeZoneIdx: 0,
                officeZone: [
                    {
                        deptno: "",
                        text: "",
                    },
                ],
                menuData: [], //最近使用菜单数组
                //常用服务菜单数组
                defaultInsideList: [
                    {
                        commonTitle: "消费服务",
                        commonMenu: [
                            {
                                title: "充值缴费",
                                describe: "一卡通充值…",
                                recentImgUrl: require("../../../static/images/property safety-fill(1).png"),
                                iconImgUrl: require("../../../static/images/property safety-fill.png"),
                                goToUrl: "/pages/recharge/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(198,181,255,1) 0%,rgba(139,94,255,1) 100%);",
                            },
                            {
                                title: "票券服务",
                                describe: "餐券、电子券…",
                                recentImgUrl: require("../../../static/images/ticket.png"),
                                iconImgUrl: require("../../../static/images/Coupon.png"),
                                goToUrl: "/pages/ticket/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                        ],
                    },
                    {
                        commonTitle: "餐饮服务",
                        commonMenu: [
                            {
                                title: "订餐服务",
                                describe: "订餐外卖半成…",
                                recentImgUrl: require("../../../static/images/Ordering meals2.png"),
                                iconImgUrl: require("../../../static/images/Ordering meals.png"),
                                goToUrl: "/pages/orderFood/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                            {
                                title: "餐厅预订",
                                describe: "餐厅预订管理…",
                                recentImgUrl: require("../../../static/images/Book.png"),
                                iconImgUrl: require("../../../static/images/carry out-fill (1).png"),
                                goToUrl: "/pages/restaurant/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "就餐服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/刀叉(1).png"),
                                iconImgUrl: require("../../../static/images/刀叉(1).png"),
                                goToUrl: "/pages/poor/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                        ],
                    },
                    {
                        commonTitle: "出行服务",
                        commonMenu: [
                            {
                                title: "班车服务",
                                describe: "查询班车服务…",
                                recentImgUrl: require("../../../static/images/bus.png"),
                                iconImgUrl: require("../../../static/images/bus1.png"),
                                goToUrl: "/pages/bus/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "约车服务",
                                describe: "约车管理服务…",
                                recentImgUrl: require("../../../static/images/carTotal1.png"),
                                iconImgUrl: require("../../../static/images/carTotal.png"),
                                goToUrl: "/pages/trafficTotal/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "订票服务",
                                describe: "快捷订票服务…",
                                recentImgUrl: require("../../../static/images/票 (1).png"),
                                iconImgUrl: require("../../../static/images/票(1).png"),
                                goToUrl: "/pages/booking/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                        ],
                    },
                    {
                        commonTitle: "来访服务",
                        commonMenu: [
                            {
                                title: "来访登记",
                                describe: "来访人员登记…",
                                recentImgUrl: require("../../../static/images/register.png"),
                                iconImgUrl: require("../../../static/images/contacts-fill.png"),
                                goToUrl: "/pages/visitRecord/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                            {
                                title: "来访邀请",
                                describe: "邀请人员来访…",
                                recentImgUrl: require("../../../static/images/Invitation.png"),
                                iconImgUrl: require("../../../static/images/smile-fill.png"),
                                goToUrl: "/pages/visitInvite/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                        ],
                    },
                    {
                        commonTitle: "会议管理",
                        commonMenu: [
                            {
                                title: "会议预定",
                                describe: "会议室预定…",
                                recentImgUrl: require("../../../static/images/Conference Room.png"),
                                iconImgUrl: require("../../../static/images/Conference Room1.png"),
                                goToUrl: "/pages/meeting/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(255,227,149,1) 0%,rgba(246,159,29,1) 100%);",
                            },
                        ],
                    },
                    {
                        commonTitle: "物业服务",
                        commonMenu: [
                            {
                                title: "物业报修",
                                describe: "物业报修服务…",
                                recentImgUrl: require("../../../static/images/wuyebaoxiu.png"),
                                iconImgUrl: require("../../../static/images/repair.png"),
                                goToUrl: "/pages/propertyRepair/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                            {
                                title: "违停上报",
                                describe: "上报违停车辆…",
                                recentImgUrl: require("../../../static/images/nostoping.png"),
                                iconImgUrl: require("../../../static/images/nostoping1.png"),
                                goToUrl: "/pages/carBreakLaw/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(255,227,149,1) 0%,rgba(246,159,29,1) 100%);",
                            },
                            {
                                title: "消防服务",
                                describe: "消防服务…",
                                recentImgUrl: require("../../../static/images/light-t.png"),
                                iconImgUrl: require("../../../static/images/light-b.png"),
                                goToUrl: "/pages/firWarn/main",
                                iconBackground:
                                    "linear-gradient(136deg,#FF9B95 0%,#FF5045 100%);",
                            },
                            //    title:  "报修任务"
                        ],
                    },
                    {
                        commonTitle: "便民服务",
                        commonMenu: [
                            {
                                title: "医疗服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/医疗 (4) (1).png"),
                                iconImgUrl: require("../../../static/images/医疗 (4).png"),
                                goToUrl: "/pages/medicalCare/main",
                                iconBackground:
                                    "linear-gradient(136deg,#FF9B95 0%,#FF5045 100%);",
                            },
                            {
                                title: "智慧阅读",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/读书选中(1).png"),
                                iconImgUrl: require("../../../static/images/读书选中(1).png"),
                                goToUrl: "/pages/read/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "充电服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/充电 (1).png"),
                                iconImgUrl: require("../../../static/images/充电.png"),
                                goToUrl: "/pages/charge/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "理发服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/百福云1.0_商圈-美容美发(1).png"),
                                iconImgUrl: require("../../../static/images/百福云1.0_商圈-美容美发(1).png"),
                                goToUrl: "/pages/haircut/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "扶贫超市",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/超市(1).png"),
                                iconImgUrl: require("../../../static/images/超市(1).png"),
                                goToUrl: "/pages/supermarket/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "洗衣服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/清洗(1).png"),
                                iconImgUrl: require("../../../static/images/清洗(1).png"),
                                goToUrl: "/pages/laundry/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "洗车服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/wash-b.png"),
                                // iconImgUrl: require("../../../static/images/wash-b.png"),
                                iconImgUrl: require("../../../static/images/首页（最新） copy 3(6).png"),
                                // goToUrl: "",
                                goToUrl: "/pages/washCar/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "洗浴服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/洗浴(1).png"),
                                iconImgUrl: require("../../../static/images/洗浴(1).png"),
                                goToUrl: "/pages/takeABath/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "保洁服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/清扫(1).png"),
                                iconImgUrl: require("../../../static/images/清扫(1).png"),
                                goToUrl: "/pages/cleaning/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "停车",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/停车  (1).png"),
                                iconImgUrl: require("../../../static/images/停车 .png"),
                                goToUrl: "/pages/parking/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "快递收发",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/快递(1).png"),
                                iconImgUrl: require("../../../static/images/快递(1).png"),
                                goToUrl: "/pages/express/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);",
                            },
                            {
                                title: "公益服务",
                                describe: "敬请期待…",
                                recentImgUrl: require("../../../static/images/公益 (1).png"),
                                iconImgUrl: require("../../../static/images/公益.png"),
                                goToUrl: "/pages/publicWelfare/main",
                                iconBackground:
                                    "linear-gradient(136deg,#FF9B95 0%,#FF5045 100%);",
                            },
                            //   title: "扶贫服务",
                            //   title: "公积金查询",
                        ],
                    },
                ],
                insideList: [],
                //来访人员菜单数组
                defaultOutsideList: [
                    {
                        commonTitle: "来访服务",
                        commonMenu: [
                            {
                                title: "票券服务",
                                describe: "餐券、电子券…",
                                recentImgUrl: require("../../../static/images/ticket.png"),
                                iconImgUrl: require("../../../static/images/Coupon.png"),
                                goToUrl: "/pages/ticket/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                            {
                                title: "来访登记",
                                describe: "来访人员登记…",
                                recentImgUrl: require("../../../static/images/register.png"),
                                iconImgUrl: require("../../../static/images/contacts-fill.png"),
                                goToUrl: "/pages/visitRecord/main",
                                iconBackground:
                                    "linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);",
                            },
                        ],
                    },
                ],
                outsideList: [],
                remeberList: wx.getStorageSync("recent")
                    ? wx.getStorageSync("recent")
                    : [], //缓存菜单数组
                remeberArr: wx.getStorageSync("recent2")
                    ? wx.getStorageSync("recent2")
                    : [], //缓存菜单数组,
                isScreen: false, //全屏开关
                // session_key: "",
                employeenum: "", //人员编号
                telephone: "", //人员手机号
                // qrCodeImg: "", //人员二维码
                userType: "12", //角色值  12外部 11内部
                userName: "", //人员名字
                isTabClick: false,
                topNum: [],
                scrollTop: 0,
                touchStartNum: 0,
                getWrapper: true,
                menuWrapperHeight: 0,
                recentUseHeight: 0,
                recentUseVal: [],
                numValue: 0,
                clientXValue: 0,
                isClientXValue: false,
                isChangeOfficeZone: false,
                officeZoneNum: "",
                // firList:['159-3561-8852','138-3454-6479','182-3409-5810','137-1853-2276','137-9492-4498']
            };
        },
        watch: {
            clientXValue(newVal, oldVal) {
                if (newVal > oldVal) {
                    this.isClientXValue = true;
                } else {
                    this.isClientXValue = false;
                }
            },
        },
        components: {
            SearchBar,
            BaseLine,
        },
        computed: {
            barHeight: function () {
                return this.$topBarHeight;
            },
            serviceData() {
                return this.userType === "11" ? this.insideList : this.outsideList;
            },
        },
        onHide() {
            get(Service.myinfo, {}, (res) => {
                // if (res.data.code === 401) {
                //     wx.redirectTo({url: wx.getStorageSync('avatarUrl')?'/pages/login/main':'/pages/home/main'});
                // }
            });
        },
        onLoad() {
            Object.assign(this.$data, this.$options.data());
            let res = wx.getSystemInfoSync();
            this.windowWidth = res.windowWidth;
            this.navWidth = res.windowWidth / 7 / 2 / 0.31887755102040816; //此处获取导航栏每一栏的宽度
        },
        onUnload() {
            get(Service.myinfo, {}, (res) => {
            });
        },
        onShow() {
            // console.log("触发show");
            this.topValue = -(
                this.barHeight +
                this.windowWidth * this.proportion +
                this.windowWidth * 0.008 * 5
            );
            if (this.scrollTop >= this.recentUseVal[1] + this.menuWrapperHeight) {
                this.topValue = 0;
            }
            // this.getQueryInfo()
            this.checkLoginState();
            this.getRepairListForInterfaceFn();
        },
        mounted() {
            this.avatarUrl = wx.getStorageSync("avatarUrl");
            // wx.setStorageSync('openid',"o78r74u1iNyytmKm5kHmlsq3cuz8");
            // wx.setStorageSync('employeenum',"8888888888");
            // wx.setStorageSync('telephone',"137-1853-2276");
            // if (wx.getStorageSync('userType')){
            //     this.serviceData=wx.getStorageSync('userType')==='11'?this.insideList:this.outsideList
            // }
            // this.getAuth();
            this.checkLoginState();
            // this.getQueryInfo()
        },
        beforeUpdate() {
            if (this.getWrapper) {
                let query = wx.createSelectorQuery();
                query
                    .select("#common-services")
                    .boundingClientRect((rect) => {
                        if (rect) {
                            if (this.recentUseVal.indexOf(rect.top || rect.bottom) === -1) {
                                this.recentUseVal = [];
                                this.recentUseVal.push(rect.top, rect.bottom);
                                this.recentUseHeight = rect.height;
                            }
                        }
                    })
                    .exec();
                this.nav.forEach((item, index) => {
                    query
                        .select("#commonMenu" + index)
                        .boundingClientRect((rect) => {
                            if (rect) {
                                if (this.topNum.indexOf(rect.top) === -1) {
                                    this.topNum.push(rect.top);
                                    if (index === this.nav.length - 1) {
                                        this.getWrapper = false;
                                        // console.log(this.topNum);
                                        wx.setStorageSync("topNum", this.topNum);
                                    }
                                }
                            }
                        })
                        .exec();
                });
            }
        },
        onPageScroll(res) {
            this.scrollTop = res.scrollTop;
            if (res.scrollTop >= this.recentUseVal[0]) {
                this.topValue = 0;
            } else if (res.scrollTop < this.recentUseVal[1] - this.recentUseHeight) {
                this.topValue = -(
                    this.barHeight +
                    this.windowWidth * this.proportion +
                    this.windowWidth * 0.008 * 5
                );
            }
            this.numValue =
                this.menuWrapperHeight -
                (this.barHeight +
                    this.windowWidth * this.proportion +
                    this.windowWidth * 0.008 * 2);

            this.topNum.forEach((item, index) => {
                if (Math.abs(res.scrollTop - Math.floor(item + this.numValue)) < 2) {
                    this.$nextTick(() => {
                        this.$nextTick(() => {
                            this.isTabClick = false;
                        });
                    });
                }
            });
            if (!this.isTabClick) {
                this.topNum.forEach((item, index) => {
                    if (this.topNum.length - 1 > index) {
                        if (
                            res.scrollTop >= this.topNum[index] + this.numValue &&
                            res.scrollTop < this.topNum[index + 1] + this.numValue - 30
                        ) {
                            this.activeIndex = index;
                        }
                    } else {
                        if (res.scrollTop >= this.topNum[index] + this.numValue) {
                            this.activeIndex = index;
                        }
                    }
                });
            }
            if (
                res.scrollTop >=
                this.topNum[4] + this.numValue - this.windowWidth * this.proportion
            ) {
                this.translateXNum = -(
                    this.navWidth * (this.nav.length - 5) +
                    this.navWidth * 0.68
                );
            } else {
                this.translateXNum = 0;
            }
        },
        onReachBottom() {
            // console.log("到达底部");
        },
        methods: {
            getRepairListForInterfaceFn() {
                get(
                    Service.getRepairListForInterface,
                    {
                        pageIndex: 1,
                        pageSize: 10,
                    },
                    (res) => {
                        // console.log("所有工单："+ res);
                        if (res.code === 0 && res.data.list) {
                            this.getUnprocessed();
                        }
                    }
                );
            },
            getUnprocessed() {
                get(Service.getBookingRepairNumForInterfaceUser, {}, (res) => {
                    console.log("未维修数量：" + res.data);
                    if (res.code === 0) {
                        if (res.data !== 0) {
                            this.isRepaired = true;
                            this.repairedNum = res.data;
                        } else {
                            this.isRepaired = false;
                        }
                    }
                });
            },
            //点击导航栏
            tabClick(e) {
                // console.log(this.topNum);
                this.isTabClick = true;
                wx.pageScrollTo({
                    scrollTop:
                        this.topNum[e] +
                        this.menuWrapperHeight -
                        (this.barHeight +
                            this.windowWidth * this.proportion +
                            this.windowWidth * 0.008 * 2),
                    duration: 100,
                });
                this.activeIndex = e;
            },
            touchStart(e) {
                if (
                    this.translateXNum ===
                    -(this.navWidth * (this.nav.length - 5) + this.navWidth * 0.68)
                ) {
                    this.difference = 0;
                }
                if (this.translateXNum === 0) {
                    this.difference =
                        this.navWidth * (this.nav.length - 5) + this.navWidth * 0.68;
                }
                this.touchStartNum = e.clientX;
                this.isClientXValue = false;
            },
            touchmoveEvent(e) {
                this.clientXValue = e.clientX;
                if (
                    this.touchStartNum < e.clientX &&
                    this.scrollTop >=
                    this.topNum[4] + this.numValue - this.windowWidth * this.proportion
                ) {
                    this.translateXNum =
                        -(this.navWidth * (this.nav.length - 5) + this.navWidth * 0.68) -
                        (this.touchStartNum - e.clientX) +
                        this.difference;
                    if (this.translateXNum > 0) {
                        this.translateXNum = 0;
                    }
                }
                // console.log(this.translateXNum);
            },
            touchEnd(e) {
                this.difference =
                    this.translateXNum -
                    -(this.navWidth * (this.nav.length - 5) + this.navWidth * 0.68);
                if (this.isClientXValue) {
                    if (
                        this.touchStartNum < this.clientXValue &&
                        this.scrollTop >=
                        this.topNum[4] + this.numValue - this.windowWidth * this.proportion
                    ) {
                        if (this.clientXValue - this.touchStartNum > this.windowWidth / 3.5) {
                            this.translateXNum = 0;
                        }
                    }
                } else {
                    if (
                        this.touchStartNum > this.clientXValue &&
                        this.scrollTop >=
                        this.topNum[4] + this.numValue - this.windowWidth * this.proportion
                    ) {
                        if (this.touchStartNum - this.clientXValue > this.windowWidth / 3.5) {
                            this.translateXNum = -(
                                this.navWidth * (this.nav.length - 5) +
                                this.navWidth * 0.68
                            );
                        }
                    }
                }
            },
            longpressEvent(e) {
                // console.log(e);
            },
            goSm() {
                wx.navigateToMiniProgram({
                    appId: "wxc9bd23790570dea4",
                    path: "pages/map/map",
                    envVersion: "release",
                    extraData: {foo: "bar"},
                    success(res) {
                    },
                });
            },
            // 根据需求跳转相对应的路由
            navigateUrl(index, type, arr) {
                //   this.topValue = 0;
                // if (this.officeZoneIdx===-1){
                //     return wx.showToast({
                //         title: '请选择工作区',
                //         icon: "none",
                //         duration: 2000
                //     });
                // }
                let url;
                if (type === "use") {
                    url = this.menuData[index].goToUrl;
                } else if (type === "service") {
                    //置灰点击无效
                    url = arr[index].goToUrl;
                    if (
                        url === "/pages/poor/main" ||
                        url === "/pages/booking/main" ||
                        url === "/pages/read/main" ||
                        url === "/pages/haircut/main" ||
                        url === "/pages/supermarket/main" ||
                        url === "/pages/laundry/main" ||
                        url === "/pages/takeABath/main" ||
                        url === "/pages/washCar/main" ||
                        url === "/pages/cleaning/main" ||
                        url === "/pages/express/main"
                    ) {
                        return;
                    }

                    let tmp;
                    let tmpList = [];
                    if (this.officeZoneNum !== "50") {
                        tmp = this.remeberList;
                        for (let i = 0; i < tmp.length; i++) {
                            if (tmp[i] === url) {
                                this.remeberList.splice(i, 1);
                                break;
                            }
                        }
                        this.remeberList.push(url);
                        if (this.remeberList.length > 4) {
                            this.remeberList.shift();
                        }
                        wx.setStorageSync("recent", this.remeberList);
                        this.remeberList.forEach((item) => {
                            arr.forEach((list) => {
                                if (item === list.goToUrl) {
                                    tmpList.unshift(list);
                                }
                            });
                        });
                    } else {
                        tmp = this.remeberArr;
                        for (let i = 0; i < tmp.length; i++) {
                            if (tmp[i] === url) {
                                this.remeberArr.splice(i, 1);
                                break;
                            }
                        }
                        this.remeberArr.push(url);
                        if (this.remeberArr.length > 4) {
                            this.remeberArr.shift();
                        }
                        wx.setStorageSync("recent2", this.remeberArr);
                        this.remeberArr.forEach((item) => {
                            arr.forEach((list) => {
                                if (item === list.goToUrl) {
                                    tmpList.unshift(list);
                                }
                            });
                        });
                    }

                    // this.remeberList.forEach((item) => {
                    //     tmpList.push(this.serviceData[item])
                    // })

                    this.menuData = tmpList;

                    // this.serviceData.forEach((list) => {
                    // console.log("最近使用", this.menuData);
                    // let tmpUrl = this.serviceData[index].goToUrl
                    // if (tmpUrl === '/pages/firWarn/main') {
                    //     wx.navigateToMiniProgram({
                    //         appId: '',
                    //         path: 'page/index/index',
                    //         envVersion: 'develop',
                    //         success(res) {
                    //         }
                    //     })
                    //     return
                    // }
                    url = arr[index].goToUrl;
                    // url = this.serviceData[index].goToUrl;
                }
                wx.navigateTo({url});
            },
            jumpToPerson() {
                wx.navigateTo({url: `/pages/personalCenter/main`});
            },
            clickQrcode() {
                this.isScreen = !this.isScreen;
            },
            setRecentList() {
                let recentList = wx.getStorageSync("recent")
                    ? wx.getStorageSync("recent")
                    : [];
                let tmpList = [];
                recentList.forEach((item) => {
                    this.serviceData.forEach((list) => {
                        list.commonMenu.forEach((list2) => {
                            if (item === list2.goToUrl) {
                                tmpList.unshift(list2);
                            }
                        });
                    });
                });
                // recentList.forEach((item) => {
                //     tmpList.push(this.serviceData[item])
                // })

                this.menuData = tmpList;
            },
            // 判断用户是否登陆
            checkLoginState() {
                if (!(wx.getStorageSync("telephone") && wx.getStorageSync("avatarUrl"))) {
                    wx.showToast({
                        title: "未登录，请先登录！",
                        icon: "none",
                        duration: 2000,
                    });
                    // console.log("头像", !!wx.getStorageSync("avatarUrl"));
                    return wx.redirectTo({
                        url: !!wx.getStorageSync("avatarUrl")
                            ? "/pages/login/main"
                            : "/pages/home/main",
                    });
                }
                get(Service.myinfo, {}, (res) => {
                    if (res.code === 0) {
                        this.officeZoneNum = res.data.officeZone;
                        // console.log(this.officeZoneNum);
                        wx.setStorageSync("officeZone", res.data.officeZone);
                        this.userType = res.data.userType;
                        this.userName = res.data.userName;
                        wx.setStorageSync("userName", res.data.userName);
                        this.employeenum = res.data.employeenum;
                        this.telephone = res.data.telephone.replace(
                            /^(.{3})(.*)(.{4})$/,
                            "$1-$2-$3"
                        );
                        let recentList;
                        if (this.officeZoneNum !== "50") {
                            recentList = wx.getStorageSync("recent");
                            if (recentList.length === 0) {
                                this.remeberList.unshift("/pages/recharge/main");
                                wx.setStorageSync("recent", this.remeberList);
                            }
                        } else {
                            recentList = wx.getStorageSync("recent2");
                            if (recentList.length === 0) {
                                this.remeberArr.unshift("/pages/recharge/main");
                                wx.setStorageSync("recent2", this.remeberArr);
                            }
                        }

                        // //消防权限
                        // let fire=this.firList.some((item)=>{
                        //     return this.telephone===item
                        // })
                        // if (!fire){
                        //     this.insideList=this.insideList.filter((item)=>{
                        //         return item.goToUrl!=="/pages/firWarn/main"
                        //     })
                        // }

                        this.myOfficeZone();
                        if (+res.data.userType === 11) {
                            //内部人员才会有权限的判断
                            this.getMyMenus();
                        } else {
                            this.outsideList = this.defaultOutsideList;
                            this.setRecentList();
                        }
                    }
                });
            },
            changeOfficeZone(e) {
                this.getRepairListForInterfaceFn();
                this.isChangeOfficeZone = true;
                // console.log("changeOfficeZone")
                this.officeZoneIdx = e.mp.detail.value;
                //   console.log(
                //     "000",
                //     this.officeZoneIdx,
                //     this.officeZone[this.officeZoneIdx].deptno
                //   );
                this.officeZoneNum = this.officeZone[this.officeZoneIdx].deptno;
                wx.setStorageSync(
                    "officeZone",
                    this.officeZone[this.officeZoneIdx].deptno
                );
                this.checkLoginState();
            },
            myOfficeZone() {
                get(Service.myOfficeZone, {}, (res) => {
                    if (res.code === 0) {
                        this.officeZone = res.data;
                        if (wx.getStorageSync("officeZone")) {
                            for (let i = 0; i < this.officeZone.length; i++) {
                                if (
                                    this.officeZone[i].deptno === wx.getStorageSync("officeZone")
                                ) {
                                    this.officeZoneIdx = i;
                                    break;
                                }
                            }
                        }
                    }
                });
            },
            getMyMenus() {
                get(Service.myMenus, {}, (res) => {
                    let data = {
                        code: 0,
                        message: "ok",
                        data: {
                            main: [
                                "visitRecord",
                                "orderFood",
                                "visitInvite",
                                "restaurant",
                                // "meeting",
                                "bus",
                                "property",
                                // "carBreakLaw",
                                "ticket",
                                "recharge",
                                "firWarn",
                                "washCar",
                            ],
                        },
                    };
                    if (res.code === 0) {
                        let mainList = res.data.main;
                        mainList.push("booking");
                        // console.log(mainList);
                        if (mainList.length === 0) {
                            wx.showToast({
                                title: "菜单权限异常",
                                icon: "none",
                            });
                        }

                        let commonMenuArr = [
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                            {commonTitle: "", commonMenu: []},
                        ];

                        this.defaultInsideList.forEach((item, index) => {
                            item.commonMenu.forEach((insideItem, index1) => {
                                mainList.forEach((vitem, index2) => {
                                    if (
                                        insideItem.goToUrl.includes(vitem) &&
                                        commonMenuArr[index].commonMenu.indexOf(insideItem) === -1
                                    ) {
                                        commonMenuArr[index].commonMenu.push(insideItem);
                                    }
                                    commonMenuArr[index].commonTitle = item.commonTitle;
                                });
                            });
                        });

                        let commonTitleArr = [];
                        commonMenuArr.forEach((item, index) => {
                            if (item.commonMenu.length === 0) {
                                this.$nextTick(() => {
                                    commonMenuArr.splice(commonMenuArr.indexOf(item), 1);
                                });
                            } else {
                                if (commonTitleArr.indexOf(item.commonTitle) === -1) {
                                    commonTitleArr.push(item.commonTitle);
                                }
                            }
                        });

                        this.nav = commonTitleArr;
                        this.insideList = commonMenuArr;

                        // this.insideList = this.defaultInsideList.filter((insideItem) =>
                        //   insideItem.commonMenu.forEach((item) => {
                        //     mainList.some((vitem) => item.goToUrl.includes(vitem));
                        //   })
                        // );
                        // this.insideList = this.defaultInsideList;
                        // this.insideList = this.defaultInsideList.filter(insideItem => mainList.includes(insideItem.goToUrl))

                        if (this.isChangeOfficeZone) {
                            this.topNum = [];
                            let timer = setTimeout(() => {
                                wx.pageScrollTo({
                                    scrollTop: 0,
                                    duration: 0,
                                });
                                let query = wx.createSelectorQuery();
                                this.serviceData.forEach((item, index) => {
                                    query
                                        .select("#commonMenu" + index)
                                        .boundingClientRect((rect) => {
                                            if (rect) {
                                                if (this.topNum.indexOf(rect.top) === -1) {
                                                    this.topNum.push(rect.top);
                                                    if (index === this.serviceData.length - 1) {
                                                        // console.log(this.topNum);
                                                        wx.setStorageSync("topNum", this.topNum);
                                                    }
                                                }
                                            }
                                        })
                                        .exec();
                                });
                                this.isChangeOfficeZone = false;
                                clearTimeout(timer);
                            }, 50);
                        }

                        //过滤掉之前最近使用有的菜单
                        let recentList;
                        if (this.officeZoneNum !== "50") {
                            recentList = wx.getStorageSync("recent")
                                ? wx.getStorageSync("recent")
                                : [];
                        } else {
                            recentList = wx.getStorageSync("recent2")
                                ? wx.getStorageSync("recent2")
                                : [];
                        }

                        recentList = recentList.filter((recentListItem) =>
                            mainList.some((vitem) =>
                                recentListItem ? recentListItem.includes(vitem) : ""
                            )
                        );
                        if (this.officeZoneNum !== "50") {
                            wx.setStorageSync("recent", recentList);
                        } else {
                            wx.setStorageSync("recent2", recentList);
                        }
                        let tmpList = [];
                        recentList.forEach((item) => {
                            this.serviceData.forEach((list) => {
                                list.commonMenu.forEach((list2) => {
                                    if (item === list2.goToUrl) {
                                        tmpList.unshift(list2);
                                    }
                                });
                            });
                        });
                        this.menuData = tmpList;
                    } else {
                        wx.showToast({
                            title: res.message,
                            icon: "none",
                        });
                    }
                });
            },
        },
    };
</script>

<style scoped lang="scss">
    @import "./main.scss";
    /*a{*/
    /*background: linear-gradient(136deg,rgba(133,216,255,1) 0%,rgba(15,144,221,1) 100%);深蓝*/
    /*background: linear-gradient(136deg,rgba(198,181,255,1) 0%,rgba(139,94,255,1) 100%);紫色*/
    /*background: linear-gradient(136deg,rgba(114,255,204,1) 0%,rgba(28,194,206,1) 100%);浅蓝*/
    /*background: linear-gradient(136deg,rgba(255,227,149,1) 0%,rgba(246,159,29,1) 100%);黄色*/
    /*}*/
</style>
