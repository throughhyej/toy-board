package rose.systems.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {

		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/");
			return;
		}

		response.sendRedirect("/");
			
		/*
		 * if (roleNames.contains("ROLE_MEMBER")) { response.sendRedirect("/"); return;
		 * }
		 * 
		 * if (roleNames.contains("ROLE_USER")) { response.sendRedirect("/home");
		 * return; }
		 */
	}
}
