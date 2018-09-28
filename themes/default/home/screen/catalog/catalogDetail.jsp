<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" buffer="none"%>
<%@ taglib uri="/tags/website" prefix="website"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/tags/website-function" prefix="fn"%>
<website:title> ${regionStatistics.region_name }公共数据开放平台_数据目录</website:title>
<website:meta name="title" content="数据开放平台_数据目录" />
<website:meta name="Keywords" content="大数据,数据开放,数据应用" />
<website:meta name="Description"
	content="数据开放平台融合政府数据、社会数据，面向社会开放提供海量数据资源。" />

<website:script src="js/utils/template-native.js" />
<script>
	var isLogin_url = "${fn:getLink('interact/correctionFd.do') }?method=isLogin";
	var correctionSubmit_url = "${fn:getLink('interact/correctionFd.do') }?method=addCorrection";
</script>
<website:script src="libs/assets/dialog/dialog.js" />
<website:script src="js/catalog/jc/site.js" />
<website:style rel="stylesheet"
	href="libs/assets/jquery.tagsinput/jquery.tagsinput.css" />
<website:style rel="stylesheet"
	href="libs/assets/jquery-sinaEmotion/jquery-sinaEmotion.css" />
<website:style rel="stylesheet" href="css/libs/iconfont/iconfont.css" />
<website:style rel="stylesheet" href="css/catalog/commonDetail.css" />
<website:style rel="stylesheet" href="css/catalog/pagination.css" />
<website:style rel="stylesheet" href="css/catalog/catalog.css" />
<style>
.m-select .sel-list>ul>li {
	min-width: 100px;
}

.sel-corners .sel-title {
	width: 150%;
}

.m-select .sel-list {
	width: 150%;
}
</style>
<c:if test="${empty cata_id || empty openCatalog }">
	<div class="main">非法请求，数据不存在!</div>
</c:if>
<c:if test="${not empty cata_id && not empty openCatalog }">
	<div class="main">
		<input type="hidden" name="cata_id" id="cata_id" value="${cata_id }" />
		<input type="hidden" name="org_code" id="org_code" value="${openCatalog.org_code}" />
		<input type="hidden" name="cata_name" id="cata_name"
			value="${openCatalog.cata_title }" />
		<div class="content" style="margin-left: 0px;">
			<div class="detail-right">
				<div class="right-title">
					<div class="detail-header">
						<span id="dataCatalogTitle" class="detail-title">${openCatalog.cata_title }</span>
						<div
							class="detail-operation bdsharebuttonbox bdshare-button-style0-16 xz_dy xz_dyfx"
							style="width: 300px">
							<span class="detail-share"> <i
								class="iconfont icon-fenxiang"></i> <a href="#" class="bds_more"
								data-cmd="more" style="background-image: none;">分享</a>
							</span>
							<script>
								window._bd_share_config = {
									"common" : {
										"bdSnsKey" : {},
										"bdText" : "",
										"bdMini" : "2",
										"bdMiniList":["mshare","qzone","tsina","weixin","tqq","douban","tieba","sqq"],
										"bdPic" : "",
										"bdStyle" : "0",
										"bdSize" : "16",
										"bdPopupOffsetTop" : "-40",
										"bdPopupOffsetLeft" : "-40"
									},
									"share" : {}

								};
								with (document)
									0[(getElementsByTagName('head')[0] || body)
											.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
											+ ~(-new Date() / 36e5)];
							</script>
							<c:choose>
								<c:when test="${0 == isFav}">
									<span class="detail-collection" id="collection"
										onclick="collection()" style="margin-right: 20px"><i
										class="iconfont icon-shoucang"></i><em>收藏</em></span>
									<span class="detail-collection active" id="cancelCollection"
										onclick="cancleCollection()"
										style="display: none; margin-right: 20px"><i
										class="iconfont icon-shoucang"></i><em>已收藏</em></span>
								</c:when>
								<c:otherwise>
									<span class="detail-collection" id="collection"
										onclick="collection()"
										style="display: none; margin-right: 20px"><i
										class="iconfont icon-shoucang"></i><em>收藏</em></span>
									<span class="detail-collection active"
										style="margin-right: 20px" id="cancelCollection"
										onclick="cancleCollection()"><i
										class="iconfont icon-shoucang"></i><em>已收藏</em></span>
								</c:otherwise>
							</c:choose>
							<span id="corBtn" class="detail-share"> <i
								class="iconfont icon-yuyin"></i><em>纠错</em>
							</span>
							<c:if test="${1 == isShowApplyBtn}">
								<span id="apply" class="detail-share" style="margin-left: 20px">
									<i class="iconfont icon-shoucang"></i><em>
								   		<c:choose>  
										   <c:when test="${'0003' == isApply || '0009' == isApply}">
 												申请
										   </c:when>  
										   <c:otherwise> 已申请 
										   </c:otherwise>  
										</c:choose>  
									</em>
								</span>
							</c:if>
						</div>
					</div>
					<div class="detail-simple-info">
						<c:if
							test="${func:contains(openCatalog.conf_use_type, '1') || func:contains(openCatalog.conf_use_type, '4')}">
							<div class="detail-format" id="detail-format"
								catalog_format="${openCatalog.conf_catalog_format}"></div>
						</c:if>
						<div class="detail-count">
							<c:if
								test="${func:contains(openCatalog.conf_use_type, '1') || func:contains(openCatalog.conf_use_type, '4')}">
								<span>数据量：${empty openCatalog.catalogStatistic || empty openCatalog.catalogStatistic.data_count? 0:openCatalog.catalogStatistic.data_count}</span>
							</c:if>
							<c:if test="${func:contains(openCatalog.conf_use_type, '2')}">
								<span>文件数：${empty openCatalog.catalogStatistic || empty openCatalog.catalogStatistic.file_count? 0:openCatalog.catalogStatistic.file_count}</span>
							</c:if>
							<c:if test="${func:contains(openCatalog.conf_use_type, '3')}">
								<span>接口数量：${empty openCatalog.catalogStatistic ||empty openCatalog.catalogStatistic.api_count? 0:openCatalog.catalogStatistic.api_count}</span>
							</c:if>

						</div>
					</div>
				</div>
				<div class="m-tab" cur_target="${target_tab}">
					<div class="right-nav tab-header">
						<ul>
							<li target="data-info" class="data-info active"><i
								class="iconfont icon-xinxi"></i>基本信息</li>
							
							<li target="data-meta" class="data-meta"><i
									class="iconfont icon-liebiao"></i>数据项</li>
							<c:if test="${1 == isShowOtherTab}">
								<c:if
									test="${func:contains(openCatalog.conf_use_type, '1') || func:contains(openCatalog.conf_use_type, '4')}">
									<li target="data-table" class="data-table"><i
										class="iconfont icon-liebiao1"></i>数据详情</li>
								</c:if>
								<%--<li target="data-relaction" class="data-relaction"><i
									class="iconfont">&#xe665;</i>关联信息</li>
								<c:if test="${func:contains(openCatalog.conf_use_type, '4')}">
									<li target="data-map" class="data-map"><i class="iconfont">&#xe695;</i>地图服务</li>
								</c:if>--%>
							</c:if>
							<c:if test="${1 == isShowDownTab}">
								<c:if test="${openCatalog.conf_use_type != '3' && openCatalog.conf_use_type != '3,'}">
									<li target="data-download" class="data-download"><i
										class="iconfont icon-xiazai"></i>文件下载</li>
								</c:if>
							</c:if>
							<c:if test="${1 == isShowOtherTab}">
								<c:if test="${openCatalog.conf_use_type != '2' && openCatalog.conf_use_type != '2,'}">
									<li target="data-api" class="data-api"><i
										class="iconfont icon-jinru"></i>API服务</li>
								</c:if>
							</c:if>
							<li target="data-comment" class="data-comment"
								onclick="queryPage(1)"><i class="iconfont">&#xe685;</i>交流互动</li>
						</ul>
					</div>
					<div class="detail-info-list tab-body">
						<ul>
							<li action="data-info">
								<!--  右侧基本信息开始 -->
								<div class="detail-base-list">
									<div class="content-title">
										<i class="iconfont"></i>基本信息
									</div>
									<div class="info-list">
										<ul>
											<li>
												<div class="info-header">数据目录名称</div>
												<div class="info-body">${openCatalog.cata_title }</div>
											</li>
											<li>
												<div class="info-header">开放状态</div>
												<div class="info-body">${openCatalogFromDict.open_type}</div>
											</li>
											<li>
												<div class="info-header">所属主题</div>
												<div class="info-body">${cataLogGroupsStr}</div>
											</li>
											<li>
												<div class="info-header">来源部门</div>
												<div class="info-body">${openCatalog.org_name }</div>
											</li>
											<li style="width: 100%;">
												<div class="info-header">关键词</div>
												<div class="info-body" id="cata_tags"
													tags="${openCatalog.cata_tags }"></div>
											</li>
											<li>
												<div class="info-header">更新时间</div>
												<div class="info-body">
													<fmt:formatDate value="${openCatalog.conf_data_update_time}"
														type="both" />
												</div>
											</li>									
											<li>
												<div class="info-header">更新频率</div>
												<div class="info-body">${openCatalogFromDict.conf_update_cycle}</div>
											</li>
											<li>
												<div class="info-header">数据格式</div>
												<div class="info-body">${openCatalogFromDict.conf_use_type}</div>
											</li>
											<li >
												<div class="info-header">发布时间</div>
												<div class="info-body">
													<fmt:formatDate value="${openCatalog.conf_released_time}"
														type="both" />
												</div>
											</li>
											<li style="display:none">
												<div class="info-header">所属行业</div>
												<div class="info-body">${cataLogIndustrysStr}</div>
											</li>
										</ul>
									</div>
									<div class="content-title">
										<i class="iconfont"></i>内容简介
									</div>
									<div class="info-list">
										<ul>
											<li style="width: 100%;">
												<div class="info-header">简介</div>
												<div class="info-body">${openCatalog.description }</div>
											</li>
										</ul>
									</div>
									<div class="content-title">
										<i class="iconfont"></i>使用情况
									</div>
									<div class="info-list">
										<ul>
											<li>
												<div class="info-header">下载次数</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_file_count ? 0:  openCatalog.catalogStatistic.use_file_count}</div>
											</li>
											<li>
												<div class="info-header">浏览次数</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_visit ? 0:openCatalog.catalogStatistic.use_visit}</div>
											</li>
											<li>
												<div class="info-header">评分人数</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_points ? 0:openCatalog.catalogStatistic.use_points}</div>
											</li>
											<li>
												<div class="info-header">评价次数</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_comments ? 0:openCatalog.catalogStatistic.use_comments}</div>
											</li>
											<li>
												<div class="info-header">评分总数</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_scores ? 0:openCatalog.catalogStatistic.use_scores}</div>
											</li>
											<li>
												<div class="info-header">平均评分</div>
												<div class="info-body">${empty openCatalog.catalogStatistic||empty openCatalog.catalogStatistic.use_grade ? 0:openCatalog.catalogStatistic.use_grade}</div>
											</li>
										</ul>
									</div>
								</div> <!--  右侧基本信息结束 -->
							</li>
								<li action="data-meta" style="display: none">
									<!--  右侧数据项开始 -->
									<div class="detail-table">
										<table id="metaTable"
											class="m-table table-bordered table-hover table-info">
											<thead>
												<tr>
													<th width="60px">序号</th>
													<%-- <th width="100px" style="text-align: left">英文名称</th> --%>
													<th width="150px" style="text-align: left">中文名称</th>
													<th width="80px">数据格式</th>
													<th width="90px">是否统计项</th>
													<th width="90px">是否展现项</th>
													<th width="90px">是否搜索项</th>
													<th width="90px">是否排序项</th>
													<th>中文描述</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${!empty openCatalog && !empty openCatalog.columns}">
														<c:set var="line_num" value="1" />
														<c:forEach var="item" items="${openCatalog.columns}">
															<c:if test="${item.name_en != 'inspur_id'}">
																<tr class="${line_num%2 == 0 ? 'back_gray' : ''}">
																	<td style="text-align: center;">${line_num}</td>
																	<%-- <td>${empty item.cataLogOpenColumnConfigure||empty item.cataLogOpenColumnConfigure.meta_column_name_en ? "":item.cataLogOpenColumnConfigure.meta_column_name_en}</td> --%>
																	<td class="textleft">${item.name_cn}</td>
																	<td style="text-align: center">${item.data_format}</td>
																	<td style="text-align: center;"><c:if
																			test="${item.is_count!=0}">√</c:if> <c:if
																			test="${item.is_count==0}">×</c:if></td>
																	<td style="text-align: center;"><c:if
																			test="${item.is_list!=0}">√</c:if> <c:if
																			test="${item.is_list==0}">×</c:if></td>
																	<td style="text-align: center;"><c:if
																			test="${item.is_search!=0}">√</c:if> <c:if
																			test="${item.is_search==0}">×</c:if></td>
																	<td style="text-align: center;"><c:if
																			test="${item.is_order!=0}">√</c:if> <c:if
																			test="${item.is_order==0}">×</c:if></td>
																	<td style="text-align: left;" title="${item.yw_die }"><c:if
																			test="${empty(item.yw_die)}">无</c:if> <c:if
																			test="${!empty(item.yw_die)}">${fn:subString(item.yw_die,10)}</c:if>
																	</td>
																</tr>
																<c:set var="line_num" value="${line_num+1 }" />
															</c:if>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="9" style="text-align: center;">暂无元数据信息</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
									</div> <!--  右侧数据项结束 -->
								</li>
							<c:if test="${1 == isShowOtherTab}">
								<c:if
									test="${func:contains(openCatalog.conf_use_type, '1') || func:contains(openCatalog.conf_use_type, '4')}">
									<li action="data-table" style="display: none">
										<iframe
											src=""
											id="ext_app_iframe_datalist" name="ext_app_iframe_datalist"
											marginheight="0" marginwidth="0" width="100%" height="100%"
											style="min-height: 320px;" frameborder="0"></iframe>
									</li>
								</c:if>
								<%--<li action="data-relaction" style="display: none">
									<!--  右侧分析内容开始 --> <website:widget
										path="catalog/catalogRelactionInfo.jsp" /> <!--  右侧分析内容结束 -->
								</li>
								<c:if test="${func:contains(openCatalog.conf_use_type, '4')}">
									<li action="data-map" style="display: none">
										<iframe
											src=""
											id="ext_app_iframe_map" name="ext_app_iframe_map"
											width="100%" height="100%" frameborder="0"></iframe>
									</li>
								</c:if>--%>
							</c:if>
							<c:if test="${1 == isShowDownTab}">
								<c:if test="${openCatalog.conf_use_type != '3' && openCatalog.conf_use_type != '3,'}">
									<li action="data-download" style="display: none"><website:widget
											path="catalog/catalogDownloadInfo.jsp?cata_id=${cata_id}" />
									</li>
								</c:if>
							</c:if>
							<c:if test="${1 == isShowOtherTab}">
								<c:if test="${openCatalog.conf_use_type != '2' && openCatalog.conf_use_type != '2,'}">
									<li action="data-api">
										<div class="detail-api">
											<ul class="api-list" id="detail_api_list">
											</ul>
											<div class="m-page pagination pg-info" id="Pagination_api"
												style="text-align: right;"></div>
										</div>
									</li>
								</c:if>
							</c:if>
							<li action="data-comment" style="display: none"><website:widget
									path="catalog/cataInteract.jsp?cata_id=${cata_id }" /></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="modalehhc" class="modal fade"
		style="width: 450px; position: absolute; left: 400px; top: 200px">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"
					style="background-color: #3498DB; width: 450px;">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" style="color: #FFFFFF">我要纠错</h4>
				</div>
				<div class="modal-body">
					<div class="m-form" style="padding: 7px 0 5px;">
						<label class="form-label"> 反馈类别： </label>
						<div>

							<select id="visit_url" class="sel-corners" name="visit_url"
								style="width: 150%">
								<option value="数据与实际情况不符">数据与实际情况不符</option>
								<option value="资源过时">资源过时</option>
								<option value="数据无法下载">数据无法下载</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
					<div class="m-form">
						<label class="form-label"> 数据描述： </label>
						<textarea name="text"
							style="width: 250px; height: 106px; margin-left: 2px;" id="desc"></textarea>
					</div>
				</div>
				<div class="modal-footer" style="width: 450px;">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="correctionBtn" type="button" class="btn btn-primary">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->


	<script id="detail-api-div" type="text/html">
<? if(data){ ?>
	<? for(var j = 0;j<data.length;j++){ ?>
	<li>
		<div class="api-header">
			<span class="api-name"><?= data[j].service_name ?></span> 
			<span class="api-version">版本：<?= data[j].version_name ?></span> 
			<span class="api-url">&nbsp;&nbsp;&nbsp;</span>
			<span class="api-operate">[&nbsp;<i>收起</i>&nbsp;]
			</span>
		</div>
		<div class="api-body">
			<div class="api-body-left">
				<div class="api-fixed">
					<div class="api-apply">
						<a href="JavaScript:void(0)" data-url ="/odweb/dev/console/serviceApply.htm?service_id=<?= data[j].open_service_id ?>" class="m-btn btn-info">申请服务</a>
					</div>
					<div class="api-test">
						<a href="/odweb/dev/developer/serviceTest.htm?service_id=<?= data[j].open_service_id ?>" class="m-btn btn-blank">在线测试</a>
					</div>
				</div>
				<div class="api-part">
                	<div class="api-title"><i class="iconfont icon-yingyong"></i>功能说明</div>
                	<div class="api-detail"><?= data[j].service_desc ?></div>
                </div>
				<div class="api-part">
                    <div class="api-title"><i class="iconfont icon-APIjieru"></i>服务调用</div>
                    <div class="api-detail">
                         <div>上下文地址：<?= data[j].service_uri ?></div>
                     </div>
                    <div class="api-detail">
                         <div>接口版本：<?= data[j].version_name ?></div>
                     </div>
                </div>
				<div class="api-part">
					<div class="api-title">
						<i class="iconfont icon-jinru"></i>请求参数
					</div>
					<div class="api-detail">
						<div>所有参数都需进行URL编码。</div>
						<div class="api-table">
							<div>通用参数</div>
							<table>
								<thead>
									<tr>
										<th width="25%">参数名称</th>
										<th width="15%">是否必须</th>
										<th width="10%">类型</th>
										<th width="50%">描述</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><span>access_token</span></td>
										<td><span>必填</span></td>
										<td><span>字符</span></td>
										<td class="api-desc">OAuth2.0验证授权后获得的token</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="api-table">
							<div>私有参数</div>
							<table>
								<thead>
									<tr>
										<th width="25%">参数名称</th>
										<th width="15%">是否必须</th>
										<th width="10%">类型</th>
										<th width="50%">描述</th>
									</tr>
								</thead>
								<tbody>
									<? if(!(data[j].additional_info)||!(data[j].additional_info.parameter_desc)){ ?>
										<tr>
											<td colspan=4>无数据</td>
										</tr>
									<? }?>
									<? if(data[j].additional_info && data[j].additional_info.parameter_desc){ ?>
										<? for (var i = 0; i < data[j].additional_info.parameter_desc.length; i ++) { ?>
									        <tr>
												<td><span><?= data[j].additional_info.parameter_desc[i].name ?></span></td>
												<td>
													<span>
													<? if(data[j].additional_info.parameter_desc[i].type== 'string'){ ?>
														字符型
													<? } ?>
													<? if(data[j].additional_info.parameter_desc[i].type== 'number'){ ?>
														数值型
													<? } ?>
													<? if(data[j].additional_info.parameter_desc[i].type== 'boolean'){ ?>
														布尔型
													<? } ?>
													</span>
												</td>
												<td>
													<span><? if(data[j].additional_info.parameter_desc[i].requires== '1'){ ?>
														必填
													<? } ?>
													<? if(data[j].additional_info.parameter_desc[i].requires== '0'){ ?>
														选填
													<? } ?>
													</span>
												</td>
												<td><?= data[j].additional_info.parameter_desc[i].description ?></td>
											</tr>
									    <? } ?>
									<? }?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="api-part">
					<div class="api-title">
						<i class="iconfont icon-chexiao"></i>返回参数
					</div>
					<div class="api-detail">
						<div class="api-table">
							<table>
								<thead>
									<tr>
										<th width="25%">返回属性名称</th>
										<th width="75%">描述</th>
									</tr>
								</thead>
								<tbody>
									<? if(!(data[j].additional_info)||!(data[j].additional_info.result_desc)){ ?>
										<tr>
											<td colspan=2>无数据</td>
										</tr>
									<? } ?>
									<? if(data[j].additional_info && data[j].additional_info.result_desc){ ?>
										<? for (var i = 0; i < data[j].additional_info.result_desc.length; i ++) { ?>
											<tr>
												<td><span><?= data[j].additional_info.result_desc[i].name ?><span></td>
												<td><span><?= data[j].additional_info.result_desc[i].description ?><span></td>
											</tr>
										<? } ?>
									<? } ?>
										<tr>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		</li>
		<? } ?>
<? } ?>
</script>

	<script type="text/javascript">
		var session_uid = "${sessionScope.uid}";
		var session_avatar = "${sessionScope.userInfo.avatar}";
		var cityName = "${sessionScope.regionStatistics.region_name }";
		var cityCode = "${sessionScope.regionStatistics.region_code }";

		var cata_id = "${cata_id}";
		var ananly = "${dataanaly_context}";
		var columns = [];
		/* <c:forEach items="${cataLogMeta}" var="column">
		columns.push({
			data_type : '${column.data_format}',
			name_en : '${column.meta_column_name_en }',
			name_cn : '${column.name_cn }'
		});
		</c:forEach> */
		$(function() {

			//  纠错
			$("#corBtn").click(function() {
				if (!isLogged()) {
					showLoginDialog();
					return;
				}
				$('#modalehhc').modal('show');
			});
			//  纠错关闭
			$("#closeBtn").click(function() {
				$("#desc").val("");
				$('#modalehhc').modal('hide');
			});
			$("#correctionBtn").click(function() {
				var desc = $("#desc").val();

				var visit_url = $("#visit_url").find("option:selected").val();
				var cataid = "${cata_id}";
				var title = $("#dataCatalogTitle").html();
				var catacode = $("#catacode").val();
				var org_code=$("#org_code").val();

				if (desc == "") {
					dialog.info('请输入描述内容', function() {
					}, 2000);

				} else {
					$.ajax({
						url : correctionSubmit_url,
						type : "POST",
						data : {
							"desc" : desc,
							"cataid" : cataid,
							"visit_url" : visit_url,
							"title" : title,
							"org_code" : org_code
						},
						success : function(data) {
							dialog.info(data, function() {
							}, 2000);
							$('#modalehhc').modal('hide');
							$("#desc").val("");
						},
						error : function(data) {
							dialog.info("网络错误！", function() {
							}, 2000);
						}
					});
				}

			});
			$('body').on('click', '.btn-info', function() {
				if (!isLogged()) {
					showLoginDialog();
					return;
				}else{
					var url_info = $(this).attr("data-url");
					$(".btn-info").attr("href", url_info);
				}
			});
		})
		 //申请按钮单击
	    $("#apply").click(function(){
	    	var isApply = "${isApply}";
	    	var applyTip = "${applyTip}";
	    	if(isApply == "0000" || isApply == "0002"){
	    		dialog.info(applyTip, function() {}, 2000);
	    	}else if(isApply == "0001" || isApply == "0003"  || isApply == "0004" || isApply == "0009"){
	    		dialog.info(applyTip, function() {
	    			var cataid = "${cata_id}";
	            	var authen_level = "${authen_level}";
	            	var partopen_user_level = "${partopen_user_level}";
	            	var user_type = "${user_type}";
	            	var cata_name = $("#cata_name").val();
	            	var org_name = $("#org_name").val();
	            	if (partopen_user_level == "0" || authen_level == partopen_user_level) { //认证等级一致
	            		 window.location.href = "${fn:getLink('catalog/catalogApply.jsp')}" + "?cata_id=" + cataid;
	            	} else {
	            		dialog.info("请先进行实名认证！", function() {}, 2000);
	            		if(user_type == "21"){//企业
	            			window.location.href = "${fn:getConfValue('global.index.odweb')}/account/OrgCertification.htm"
	            		}
	            	}
	    			
	    		}, 2000);
	    	}
	    });
		
	</script>
	<script
		src="${fn:getUrl('libs/assets/jquery-sinaEmotion/jquery-sinaEmotion.js')}"></script>
	<script
		src="${fn:getUrl('libs/assets/jquery.tagsinput/jquery.tagsinput.js')}"></script>
	<script src="${fn:getUrl('libs/assets/jquery.nicescroll.min.js')}"></script>
	<script src="${fn:getUrl('libs/assets/jquery.pagination.js')}"></script>
	<script src="${fn:getUrl('js/catalog/catalogDetail.js')}"></script>
	<script src="${fn:getUrl('js/catalog/timeUtil.js')}"></script>
	<script src="${fn:getUrl('js/catalog/interact.js')}"></script>
	<script src="${fn:getUrl('js/catalog/catalogInteract.js')}"></script>
	<script src="${fn:getUrl('js/catalog/catalogApi.js')}"></script>
	<script src="${fn:getUrl('js/catalog/catalogDownload.js')}"></script>
	<script src="${fn:getUrl('js/catalog/catalogRelatedInfo.js')}"></script>
	
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=06hfQa7Ybnb2mHlQBIbGPEKV"></script>
</c:if>
