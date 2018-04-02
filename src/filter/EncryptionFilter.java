package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import wrapper.EncryptionWrapper;

/**
 * Servlet Filter implementation class EncryptionFilter
 */
@WebFilter("*.sm")
public class EncryptionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// place your code here
		System.out.println("EncryptionFilter Run");		
		
		//로그인과 회원가입시 패스워드 암호화 담당하는 필터
		
		HttpServletRequest hRequest = (HttpServletRequest)request;				
		EncryptionWrapper encWrapper = new EncryptionWrapper(hRequest);

		// pass the request along the filter chain
		
		chain.doFilter(encWrapper, response);
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
