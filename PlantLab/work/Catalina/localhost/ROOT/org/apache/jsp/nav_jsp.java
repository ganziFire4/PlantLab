/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.25
 * Generated at: 2024-07-25 05:55:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class nav_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/Users/publi/.m2/repository/org/glassfish/web/jakarta.servlet.jsp.jstl/3.0.1/jakarta.servlet.jsp.jstl-3.0.1.jar!/META-INF/c.tld", Long.valueOf(1664421078000L));
    _jspx_dependants.put("/WEB-INF/lib/jakarta.servlet.jsp.jstl-3.0.1.jar", Long.valueOf(1720405479111L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fchoose;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fotherwise;

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fchoose = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fotherwise = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fchoose.release();
    _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fotherwise.release();
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title></title>\r\n");
      out.write("    <!--로고-->\r\n");
      out.write("    <link rel=\"icon\" type=\"img/png\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/images/round_logo_whiteBack.svg\">\r\n");
      out.write("    <!--jquery-->\r\n");
      out.write("    <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/jquery-3.7.1.min.js\"></script>\r\n");
      out.write("    <!--bootstrap-->\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <!--외부 css-->\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/css/nav.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/css/weather.css\">\r\n");
      out.write("    <!--외부 js-->\r\n");
      out.write("    <script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/js/weather.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"noto-sans-kr\">\r\n");
      out.write("    <nav>\r\n");
      out.write("        <div class=\"nav_left\">\r\n");
      out.write("            <div>\r\n");
      out.write("                <a href=\"/\">\r\n");
      out.write("                    <img src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/images/nav_logo.svg\" alt=\"플랜트랩 로고\">\r\n");
      out.write("                </a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div>\r\n");
      out.write("                <ul class=\"nav_menu\">\r\n");
      out.write("                    <li><a href=\"/board/board-list.do?tab=1\">커뮤니티</a></li>\r\n");
      out.write("                    <li><a href=\"#\">스토어</a></li>\r\n");
      out.write("                    <div id=\"weather\">\r\n");
      out.write("                        <li id=\"weatherList\">\r\n");
      out.write("                            <img id=\"weatherImg\" src=\"#\" alt=\"날씨 이미지\">\r\n");
      out.write("                            <img id=\"weatherLine\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/static/images/weatherLine.svg\" alt=\"라인 이미지\">\r\n");
      out.write("                            <p id=\"result\"></p>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"nav_right\">\r\n");
      out.write("            <div class=\"nav_search\">\r\n");
      out.write("                    <span>\r\n");
      out.write("                        <svg width=\"25\" height=\"25.5\" viewBox=\"0 0 30 34\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n");
      out.write("                            <path d=\"M28.9749 26.5226L23.9072 20.9181L20.0092 19.137C21.3071 17.0958 22.0025 14.6606 22 12.1652C22 5.45727 17.0654 0 11 0C4.93455 0 0 5.45727 0 12.1652C0 18.8731 4.93455 24.3304 11 24.3304C13.276 24.3333 15.4961 23.551 17.3511 22.0925L18.9574 26.3918L24.0249 31.9966C24.3499 32.3561 24.7358 32.6412 25.1604 32.8357C25.5851 33.0303 26.0402 33.1304 26.4998 33.1304C26.9595 33.1305 27.4146 33.0303 27.8393 32.8358C28.2639 32.6413 28.6498 32.3562 28.9748 31.9968C29.2998 31.6374 29.5576 31.2106 29.7335 30.741C29.9094 30.2714 30 29.7681 30 29.2597C30 28.7514 29.9095 28.2481 29.7336 27.7784C29.5577 27.3088 29.2999 26.8821 28.9749 26.5226ZM2 12.1652C2 6.67703 6.03749 2.21185 11 2.21185C15.9625 2.21185 20 6.67703 20 12.1652C20 17.6534 15.9625 22.1185 11 22.1185C6.03749 22.1185 2 17.6534 2 12.1652ZM27.5606 30.4326C27.2791 30.7433 26.8976 30.9177 26.4999 30.9177C26.1022 30.9177 25.7208 30.7433 25.4393 30.4326L20.6535 25.1399L19.1601 21.1424L22.7749 22.7939L27.5607 28.0866C27.8416 28.398 27.9993 28.8198 27.9993 29.2596C27.9993 29.6994 27.8415 30.1213 27.5606 30.4326Z\" fill=\"#878787\"/>\r\n");
      out.write("                            </svg>\r\n");
      out.write("                    </span>\r\n");
      out.write("                <input type=\"text\" id=\"search\" placeholder=\"통합검색\">\r\n");
      out.write("            </div>\r\n");
      out.write("            ");
      if (_jspx_meth_c_005fchoose_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fchoose_005f0(jakarta.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    jakarta.servlet.jsp.PageContext pageContext = _jspx_page_context;
    jakarta.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:choose
    org.apache.taglibs.standard.tag.common.core.ChooseTag _jspx_th_c_005fchoose_005f0 = (org.apache.taglibs.standard.tag.common.core.ChooseTag) _005fjspx_005ftagPool_005fc_005fchoose.get(org.apache.taglibs.standard.tag.common.core.ChooseTag.class);
    boolean _jspx_th_c_005fchoose_005f0_reused = false;
    try {
      _jspx_th_c_005fchoose_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fchoose_005f0.setParent(null);
      int _jspx_eval_c_005fchoose_005f0 = _jspx_th_c_005fchoose_005f0.doStartTag();
      if (_jspx_eval_c_005fchoose_005f0 != jakarta.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                ");
          if (_jspx_meth_c_005fwhen_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("                ");
          if (_jspx_meth_c_005fotherwise_005f0(_jspx_th_c_005fchoose_005f0, _jspx_page_context))
            return true;
          out.write("\r\n");
          out.write("            ");
          int evalDoAfterBody = _jspx_th_c_005fchoose_005f0.doAfterBody();
          if (evalDoAfterBody != jakarta.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fchoose_005f0.doEndTag() == jakarta.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fchoose.reuse(_jspx_th_c_005fchoose_005f0);
      _jspx_th_c_005fchoose_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fchoose_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fchoose_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fwhen_005f0(jakarta.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, jakarta.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    jakarta.servlet.jsp.PageContext pageContext = _jspx_page_context;
    jakarta.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:when
    org.apache.taglibs.standard.tag.rt.core.WhenTag _jspx_th_c_005fwhen_005f0 = (org.apache.taglibs.standard.tag.rt.core.WhenTag) _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.WhenTag.class);
    boolean _jspx_th_c_005fwhen_005f0_reused = false;
    try {
      _jspx_th_c_005fwhen_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fwhen_005f0.setParent((jakarta.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      // /nav.jsp(60,16) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fwhen_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginMember eq null}", boolean.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fwhen_005f0 = _jspx_th_c_005fwhen_005f0.doStartTag();
      if (_jspx_eval_c_005fwhen_005f0 != jakarta.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                    <div class=\"member\">\r\n");
          out.write("                        <ul>\r\n");
          out.write("                            <li><a href=\"#\">로그인</a></li>\r\n");
          out.write("                            |\r\n");
          out.write("                            <li><a href=\"#\">회원가입</a></li>\r\n");
          out.write("                        </ul>\r\n");
          out.write("                    </div>\r\n");
          out.write("                ");
          int evalDoAfterBody = _jspx_th_c_005fwhen_005f0.doAfterBody();
          if (evalDoAfterBody != jakarta.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fwhen_005f0.doEndTag() == jakarta.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fwhen_0026_005ftest.reuse(_jspx_th_c_005fwhen_005f0);
      _jspx_th_c_005fwhen_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fwhen_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fwhen_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fotherwise_005f0(jakarta.servlet.jsp.tagext.JspTag _jspx_th_c_005fchoose_005f0, jakarta.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    jakarta.servlet.jsp.PageContext pageContext = _jspx_page_context;
    jakarta.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:otherwise
    org.apache.taglibs.standard.tag.common.core.OtherwiseTag _jspx_th_c_005fotherwise_005f0 = (org.apache.taglibs.standard.tag.common.core.OtherwiseTag) _005fjspx_005ftagPool_005fc_005fotherwise.get(org.apache.taglibs.standard.tag.common.core.OtherwiseTag.class);
    boolean _jspx_th_c_005fotherwise_005f0_reused = false;
    try {
      _jspx_th_c_005fotherwise_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fotherwise_005f0.setParent((jakarta.servlet.jsp.tagext.Tag) _jspx_th_c_005fchoose_005f0);
      int _jspx_eval_c_005fotherwise_005f0 = _jspx_th_c_005fotherwise_005f0.doStartTag();
      if (_jspx_eval_c_005fotherwise_005f0 != jakarta.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                    <div class=\"member\">\r\n");
          out.write("                        <ul>\r\n");
          out.write("                            <li style=\"margin:0;\">\r\n");
          out.write("                                <a href=\"#\">\r\n");
          out.write("                                    <img src=\"#\" alt=\"프로필사진\" width=\"40px\" height=\"40px\">\r\n");
          out.write("                                </a>\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li style=\"margin-left: 10px; font-size: 1.1rem\">\r\n");
          out.write("                                <a href=\"#\" style=\"font-weight:400\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginMember.nickname}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</a>\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li id=\"logout\">\r\n");
          out.write("                                <a href=\"#\">로그아웃</a>\r\n");
          out.write("                            </li>\r\n");
          out.write("                        </ul>\r\n");
          out.write("                    </div>\r\n");
          out.write("                ");
          int evalDoAfterBody = _jspx_th_c_005fotherwise_005f0.doAfterBody();
          if (evalDoAfterBody != jakarta.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fotherwise_005f0.doEndTag() == jakarta.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fotherwise.reuse(_jspx_th_c_005fotherwise_005f0);
      _jspx_th_c_005fotherwise_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fotherwise_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fotherwise_005f0_reused);
    }
    return false;
  }
}
