/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.34
 * Generated at: 2024-05-08 16:07:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.views.web.testimonial;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class testimonial_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(5);
    _jspx_dependants.put("jar:file:/D:/OneDrive%20-%20University%20of%20Technology%20and%20Education/petshop/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/petshop-cats/WEB-INF/lib/sitemesh-2.4.2.jar!/META-INF/sitemesh-decorator.tld", Long.valueOf(1123653092000L));
    _jspx_dependants.put("/common/taglib.jsp", Long.valueOf(1714401051284L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1710262135216L));
    _jspx_dependants.put("jar:file:/D:/OneDrive%20-%20University%20of%20Technology%20and%20Education/petshop/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/petshop-cats/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153359882000L));
    _jspx_dependants.put("/WEB-INF/lib/sitemesh-2.4.2.jar", Long.valueOf(1710436164282L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
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

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
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
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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
      out.write("     ");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t <!-- Testimonial Start -->\r\n");
      out.write("        <div class=\"container-fluid testimonial py-5\" style=\"background: var(--bs-secondary);\">\r\n");
      out.write("            <div class=\"container py-5\">\r\n");
      out.write("                <div class=\"text-center mx-auto mb-5\" style=\"max-width: 800px;\">\r\n");
      out.write("                    <p class=\"fs-4 text-uppercase text-primary\">Chứng thực</p>\r\n");
      out.write("                    <h1 class=\"display-4 mb-4 text-white\">Đánh giá của khách hàng!</h1>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"owl-carousel testimonial-carousel\">\r\n");
      out.write("                    <div class=\"testimonial-item rounded p-4\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-4\">\r\n");
      out.write("                                <div class=\"d-flex flex-column mx-auto\">\r\n");
      out.write("                                    <div class=\"rounded-circle mb-4\" style=\"border: dashed; border-color: var(--bs-white);\">\r\n");
      out.write("                                        <img src=\"template/web/img/testimonial-1.jpg\" class=\"img-fluid rounded-circle\" alt=\"\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"text-center\">\r\n");
      out.write("                                        <h4 class=\"mb-2 text-primary\">\tYến Như </h4>\r\n");
      out.write("                                        <p class=\"m-0 text-white\">Giáo viên</p>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-8\">\r\n");
      out.write("                                <div class=\"position-absolute\" style=\"top: 20px; right: 25px;\">\r\n");
      out.write("                                    <i class=\"fa fa-quote-right fa-2x text-secondary\"></i>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"testimonial-content\">\r\n");
      out.write("                                    <div class=\"d-flex mb-4\">\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star\"></i>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <p class=\"fs-5 mb-0 text-white\">Tôi đã sử dụng dịch vụ tắm và cắt tỉa lông cho mèo tại Petshop và rất hài lòng với dịch vụ của Shop. Tôi sẽ tiếp tục đưa mèo của mình đến đây cho các dịch vụ chăm sóc trong tương lai.\r\n");
      out.write("                                    </p>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"testimonial-item rounded p-4\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-4\">\r\n");
      out.write("                                <div class=\"d-flex flex-column mx-auto\">\r\n");
      out.write("                                    <div class=\"rounded-circle mb-4\" style=\"border: dashed; border-color: var(--bs-white);\">\r\n");
      out.write("                                        <img src=\"template/web/img/testimonial-2.jpg\" class=\"img-fluid rounded-circle\" alt=\"\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"text-center\">\r\n");
      out.write("                                        <h4 class=\"mb-2 text-primary\">\tLinh Nguyễn </h4>\r\n");
      out.write("                                        <p class=\"m-0 text-white\">Luật sư</p>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-8\">\r\n");
      out.write("                                <div class=\"position-absolute\" style=\"top: 20px; right: 25px;\">\r\n");
      out.write("                                    <i class=\"fa fa-quote-right fa-2x text-secondary\"></i>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"testimonial-content\">\r\n");
      out.write("                                    <div class=\"d-flex mb-4\">\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star\"></i>\r\n");
      out.write("                                    </div>Tôi rất\r\n");
      out.write("                                    <p class=\"fs-5 mb-0 text-white\"> Tôi rất hài lòng với dịch vụ của Petshop. Nhân viên thân thiện và chuyên nghiệp. Họ luôn sẵn lòng tư vấn và giúp đỡ tôi chăm sóc thú cưng của mình một cách tốt nhất.\r\n");
      out.write("                                    </p>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"testimonial-item rounded p-4\">\r\n");
      out.write("                        <div class=\"row\">\r\n");
      out.write("                            <div class=\"col-4\">\r\n");
      out.write("                                <div class=\"d-flex flex-column mx-auto\">\r\n");
      out.write("                                    <div class=\"rounded-circle mb-4\" style=\"border: dashed; border-color: var(--bs-white);\">\r\n");
      out.write("                                        <img src=\"template/web/img/testimonial-3.jpg\" class=\"img-fluid rounded-circle\" alt=\"\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"text-center\">\r\n");
      out.write("                                        <h4 class=\"mb-2 text-primary\">\tLê Hòa </h4>\r\n");
      out.write("                                        <p class=\"m-0 text-white\">Kế toán</p>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"col-8\">\r\n");
      out.write("                                <div class=\"position-absolute\" style=\"top: 20px; right: 25px;\">\r\n");
      out.write("                                    <i class=\"fa fa-quote-right fa-2x text-secondary\"></i>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"testimonial-content\">\r\n");
      out.write("                                    <div class=\"d-flex mb-4\">\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star text-primary\"></i>\r\n");
      out.write("                                        <i class=\"fas fa-star\"></i>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <p class=\"fs-5 mb-0 text-white\">Petshop cung cấp các sản phẩm chất lượng cao và đa dạng cho thú cưng của tôi. Tôi đã mua thức ăn và đồ chơi cho mèo từ đây và rất hài lòng với sự lựa chọn và chất lượng của sản phẩm.\r\n");
      out.write("                                    </p>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <!-- Testimonial End -->\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
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
}