<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="none"%>
<%@ taglib uri="/tags/website" prefix="website"%>
<%@ taglib uri="/tags/website-function" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<website:title>${regionStatistics.region_name }公共信息资源开放平台_API超市</website:title>
<website:style href="dist/css/commonList.css"/>
<style>
.modal-dialog{
	z-index: 1051;
}
</style>
<div class="banner" style="height: 180px;background: url('${fn:getLink('dist/img/api_banner.png')}') center"></div>
<div class="main">
    <div class="g-main">
        <div class="sidebar side-r">
 			<website:widget path="rightComment/downloadList.jsp"/>
			<website:widget path="rightComment/mainTag.jsp"/>
			<website:widget path="rightComment/app.jsp"/>
        </div>
        <div class="container" style="margin-right:0px;">
            <div class="cata-filter">
                <div class="filter-selected">
                    <div class="selected-title">已选：</div>
                    <div class="selected-empty">清除已选属性</div>
                    <ul>
                        <li>
                            <span class="selected-header">主题</span>:
                            <span class="selected-body sel-first"></span>
                            <i class="iconfont">&#xe69e;</i>
                        </li>
                        <li>
                            <span class="selected-header">机构</span>:
                            <span class="selected-body sel-depart"></span>
                            <i class="iconfont">&#xe69e;</i>
                        </li>
                    </ul>
                </div>
                <div class="filter-main">
                    <div class="filter-header">分类：</div>
                    <div class="filter-body">
                        <ul class="filter-list">
                            <li class="active">推荐</li>
                            <li>主题</li>
                            <li>机构</li>
                        </ul>
                        <div class="filter-theme-part">
                            <div class="filter-theme-arrow"></div>
                            <ul class="theme-first-list">
                          		<c:forEach var="item" items="${resGroups}" varStatus="status">
										<li id="${item.group_id}"><i class="iconfont"><img src="${fn:getUrl('/img/catalog/icon/')}${item.ord}.png" alt="" /></i><span >${item.group_name }</span></li>
								</c:forEach>
                            </ul>
                        </div>
                        <div class="filter-depart-part">
                            <div class="filter-depart-arrow"></div>
                            <div class="depart-list">
                                <div class="depart-first">A-G</div>
                                <ul class="depart-main" id="A-G">

                                </ul>
                                <div class="depart-first">H-N</div>
                                <ul class="depart-main" id="H-N">

                                </ul>
                                <div class="depart-first">O-T</div>
                                <ul class="depart-main" id="O-T">

                                </ul>
                                <div class="depart-first">U-Z</div>
                                <ul class="depart-main" id="U-Z">

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" id="subjectId">
            <input type="hidden" id="orgId">
            <input type="hidden" id="orderType">
            <input type="hidden" id="odWebUrl" value="${odWebUrl}">
            <div class="cata-sort">
                <div class="sort-sum" id="record_count">共1024个API</div>
                <div class="sort-list">
                    <ul>
                        <li class="active" id = "service_id desc">综合排序<i class="iconfont icon-xiangxiapaixujiantou"></i></li>
                        <li id="online_time desc">更新时间<i class="iconfont icon-xiangxiapaixujiantou"></i></li>
                        <li id="app_count desc">应用连接数<i class="iconfont icon-xiangxiapaixujiantou"></i></li>
                    </ul>
                </div>
                <div class="sort-demand">
                    <input type="text" class="m-input" id="key" placeholder="在结果中搜索"/>
                    <i id="keySearch" class="iconfont">&#xe680;</i>
                </div>
            </div>
            <div class="cata-main" id="cata-main">
                <div class="cata-list">
					<ul id="apiList">
                      
                    </ul>
                    <div class="m-page pg-info pg-sm pagination" id="Pagination">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<website:script src="dist/js/utils/jquery.pagination.js" />
<website:script src="dist/js/api/apiIndex.js"/>
<website:script src="dist/js/api/list.js"/>
