package auth.com.itra.auth.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auth.com.itra.auth.model.User;
import auth.com.itra.auth.repository.UserRepository;
import auth.com.itra.auth.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;

	@GetMapping("/admin")
	public String userList(Model model) {
		List<User> users = userService.allUsers();
		for (User u : users) {
			userService.getStatus(u);
			userRepository.save(u);
		}
		model.addAttribute("allUsers", users);
		return "admin";
	}

	@GetMapping("/login_success_handler")
	public String loginSuccessHandler(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		List<User> users = userService.allUsers();
		for (User u : users) {
			if (u.getUsername().equals(name)) {
				u.setLastLogin(new Date());
				userRepository.save(u);
			}
		}
		return "index";
	}

	@GetMapping(value = "/checkbx")
	public String deleteUser(@RequestParam("actions") String actions, @RequestParam("cid") Long[] userIds, Model model) {
		if (actions.equals("remove")) {
			List<User> users = userService.allUsers();
			for (Long id : userIds) {
				for (User u : users) {
					if (u.getId() == id) {
						userService.deleteUser(id);
						userService.expireUserSessions(u.getUsername());
					}
				}
			}
		}
		if (actions.equals("block")) {
			List<User> users = userService.allUsers();
			for (Long id : userIds) {
				for (User u : users) {
					if (u.getId() == id) {
						userService.blockUser(id);
						userRepository.save(u);
						userService.expireUserSessions(u.getUsername());
					}
				}
			}
		}
		if (actions.equals("unblock")) {
			List<User> users = userService.allUsers();
			for (Long id : userIds) {
				for (User u : users) {
					if (u.getId() == id) {
						userService.unblockUser(id);
						userRepository.save(u);
					}
				}
			}
		}
		return "redirect:admin";
	}
}