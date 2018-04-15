<%--
Created by IntelliJ IDEA.
User: zzq
Date: 2017/12/4
Time: 15:31
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/vue/2.5.16/vue.min.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
    <div id="app">
        <el-container style="border: 1px solid #eee">
            <el-header style="background-color: rgb(738, 241, 246)">
                <el-row>
                    <el-col :span="18">
                        TZ系统
                    </el-col>
                    <el-col :span="6">
                        <el-dropdown>
                            <i class="el-icon-setting" style="margin-right: 15px"></i>
                            <el-dropdown-menu slot="dropdown">
                                <el-dropdown-item>我的</el-dropdown-item>
                                <el-dropdown-item><a href="javascript:void(0)" @click="logout()">退出</a></el-dropdown-item>
                            </el-dropdown-menu>
                        </el-dropdown>
                        <span>{{username}}</span>
                    </el-col>
                </el-row>

            </el-header>
            <el-container>
                <el-aside style="width:200px;height:700px;background-color: rgb(238, 241, 246)">
                    <el-menu :default-openeds="['1', '3']">
                        <el-submenu index="1">
                            <template slot="title"><i class="el-icon-message"></i>导航一</template>
                            <el-submenu index="1-1">
                                <template slot="title" v-for="menu in menus">
                                    {{ menu.name }}
                                </template>
                            </el-submenu>
                            <el-submenu index="1-2">
                                <template slot="title">选项4</template>
                                <el-menu-item index="1-2-1">选项4-1</el-menu-item>
                            </el-submenu>
                        </el-submenu>
                    </el-menu>
                </el-aside>
                <el-main style="background-color: rgb(638, 241, 246);height:700px;border: 1px solid #eee">
                    <el-table :data="tableData">
                        <el-table-column prop="date" label="日期" width="140">
                        </el-table-column>
                        <el-table-column prop="name" label="姓名" width="120">
                        </el-table-column>
                        <el-table-column prop="address" label="地址">
                        </el-table-column>
                    </el-table>
                </el-main>
            </el-container>

            <el-footer style="background-color: rgb(538, 241, 246)">XXXX科技有限公司</el-footer>
        </el-container>
    </div>
    <script>
        var app = new Vue({
            el:"#app",
            data:{
                menus:[],
                username:"11",
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1518 弄'
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1517 弄'
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1519 弄'
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    address: '上海市普陀区金沙江路 1516 弄'
                }]
            },
            mounted:function () {
                //页面加载完之后执行
                $.ajax({
                    url:"/admin/ajaxfirst",
                    success:function (res) {
                        app.menus=res.data.menus;
                        app.username=res.data.username;
                    }
                })
            },
            methods:{
                //退出
                logout:function () {
                    window.location.href = "/admin/logout";
                }
            }
        })
    </script>
</body>
</br>
</html>
