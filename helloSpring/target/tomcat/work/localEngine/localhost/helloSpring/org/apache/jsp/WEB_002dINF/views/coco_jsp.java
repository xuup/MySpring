package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class coco_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/css/addUser.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/bootstrap/css/bootstrap-table.min.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/js/jquery-1.9.1.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/static/resources/bootstrap/js/bootstrap-table.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\tinitList();\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tfunction initList(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tconsole.log(\"init list-------\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#cocoTable\").bootstrapTable({\r\n");
      out.write("\t\t\turl:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/cocoTest/list\",\r\n");
      out.write("\t\t\tcache: false,\r\n");
      out.write("\t\t\tdataField:\"rows\",\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tmethod:\"post\",\r\n");
      out.write("\t\t\tcontentType : \"application/x-www-form-urlencoded\",\r\n");
      out.write("\t\t\tstriped: true,\r\n");
      out.write("\t\t\tpagination: true, // 在表格底部显示分页组件，默认false\r\n");
      out.write("\t      \tpageNumber: 1, \r\n");
      out.write("\t      \tpageList: [2, 5,10], // 设置页面可以显示的数据条数\r\n");
      out.write("\t     \tpageSize: 4, // 页面数据条数\r\n");
      out.write("\t\t\tsidePagination: \"server\",\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tqueryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求\r\n");
      out.write("\r\n");
      out.write("\t\t         var param = {\r\n");
      out.write("\t        \t\t limit: params.limit,   //页面大小\r\n");
      out.write("                     offset: params.offset,  //页码\t\r\n");
      out.write("\t\t\t\t }\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t return param;\r\n");
      out.write("\t\t    },\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tresponseHandler: function(res) {\r\n");
      out.write("\t\t         return {\r\n");
      out.write("\t\t            \"total\": res.total,//总页数\r\n");
      out.write("\t\t            \"rows\": res.rows   //数据\r\n");
      out.write("\t\t         };\r\n");
      out.write("\t\t    },\r\n");
      out.write("\t\t\tcolumns:[{\r\n");
      out.write("\t\t\t\tfield:\"id\",\r\n");
      out.write("\t\t\t\ttitle:\"#\"\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:\"wareId\",\r\n");
      out.write("\t\t\t\ttitle:\"wareId\"\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:\"picPath\",\r\n");
      out.write("\t\t\t\ttitle:\"picPath\"\r\n");
      out.write("\t\t\t},{\r\n");
      out.write("\t\t\t\tfield:\"id\",\r\n");
      out.write("\t\t\t\ttitle:\"operation\",\r\n");
      out.write("\t\t\t \tformatter:function(value,row,index){\r\n");
      out.write("                    var element = \r\n");
      out.write("                    '<a class=\"edit\" onclick=\"editViewById('+value+')\" data-id=\"'+row.id +'\">编辑</a> ' + \r\n");
      out.write("                    \"<a class='edit' onclick='editViewById(\"+value+\",'view')' data-id='\"+row.id +\"'>查看</a> \" +\r\n");
      out.write("                    '<a class=\"delet\" onclick=\"deleteById('+value+')\" data-id=\"'+row.id +'\">删除</a> ';\r\n");
      out.write("                    return element;  \r\n");
      out.write("                } \r\n");
      out.write("\t\t\t}],\r\n");
      out.write("\t\t \tonLoadSuccess: function(){  //加载成功时执行\r\n");
      out.write("\t         \t   console.info(\"加载成功\");\r\n");
      out.write("\t      \t},\r\n");
      out.write("\t      \tonLoadError: function(){  //加载失败时执行\r\n");
      out.write("\t           \t console.info(\"加载数据失败\");\r\n");
      out.write("\t      \t}\r\n");
      out.write("\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tfunction editViewById(data, type){\r\n");
      out.write("\t\tconsole.log(\"data:\"+ data+\",type=\"+ type);\r\n");
      out.write("\t\t\r\n");
      out.write("\t\twindow.location.href = \"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/cocoTest/edit?id=\"+data+\"&type=\"+type;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tfunction deleteById(data){\r\n");
      out.write("\t\tconsole.log(\"---\"+data+\"---\");\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl:\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/cocoTest/delete\",\r\n");
      out.write("\t\t\tdata:{\r\n");
      out.write("\t\t\t\t\"id\":data\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\tdataType:\"json\",\r\n");
      out.write("\t\t\tmethod:\"post\",\r\n");
      out.write("\t\t\tsuccess:function(data){\r\n");
      out.write("\t\t\t\tif(data.state == \"ok\"){\r\n");
      out.write("\t\t\t\t\talert(\"删除成功!\");\r\n");
      out.write("\t\t\t\t\t$(\"#cocoTable\").bootstrapTable('refresh');\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"blog-masthead\">\r\n");
      out.write("     <div class=\"container\">\r\n");
      out.write("       <nav class=\"blog-nav\">\r\n");
      out.write("         <a class=\"blog-nav-item active\" href=\"#\">Home</a>\r\n");
      out.write("         <a class=\"blog-nav-item\" href=\"#\">New features</a>\r\n");
      out.write("         <a class=\"blog-nav-item\" href=\"#\">Press</a>\r\n");
      out.write("         <a class=\"blog-nav-item\" href=\"#\">New hires</a>\r\n");
      out.write("         <a class=\"blog-nav-item\" href=\"#\">About</a>\r\n");
      out.write("       </nav>\r\n");
      out.write("     </div>\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("<form id=\"reg_form\" action=\"#\">\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\t<div class=\"row\">\r\n");
      out.write("\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t<ul class=\"nav nav-list\">\r\n");
      out.write("                <li><a href=\"#\">Home</a></li>\r\n");
      out.write("                <li class=\"active\"><a href=\"#\">Tutorials</a></li>\r\n");
      out.write("                <li><a href=\"#\">Practice Editor </a></li>\r\n");
      out.write("                <li><a href=\"#\">Gallery</a></li>\r\n");
      out.write("                <li><a href=\"#\">Contact</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<div class=\"col-sm-8\">\r\n");
      out.write("\t\t\t<h1>你好，世界！");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ctx }", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("</h1>\r\n");
      out.write("\t\t\t<div>\r\n");
      out.write("\t\t\t\t<table class=\"table\" id=\"cocoTable\">\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fset_005f0.setParent(null);
    // /WEB-INF/views/coco.jsp(5,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setVar("ctx");
    // /WEB-INF/views/coco.jsp(5,0) name = value type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
    _jspx_th_c_005fset_005f0.setValue(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/coco.jsp(5,0) '${pageContext.request.contextPath}'",_el_expressionfactory.createValueExpression(_jspx_page_context.getELContext(),"${pageContext.request.contextPath}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
    int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
    if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
    return false;
  }
}
