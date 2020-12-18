package auth.com.itra.auth.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
    	List<User>users=userService.allUsers();
    	for (User u:users) {
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
        List<User>users=userService.allUsers();
    	for (User u:users) {
    		if (u.getUsername().equals(name)) {
    			u.setLastLogin(new Date());
    		userRepository.save(u);
    		}
    	}
        return "index";
    }  

    @GetMapping(value = "/checkbx")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) String action,
    						  @RequestParam("cid") Long[] userIds, 
    						  Model model) {
  		System.out.println("hi");

    	System.out.println(action);
//  		System.out.println(Arrays.toString(userIds));
  		System.out.println("Bye");

  	if (action.equals("remove")){
  		System.out.println("del");
//    		List<User>users=userService.allUsers();
//        	for (Long id:userIds) {
//        		for (User u:users) {
//        			if (u.getId()==id) {
//        	        	 userService.deleteUser(id);
//        	        	 userRepository.save(u);
//        			}
//        		}
//        	}
        }
        if (action.equals("block")){
      		System.out.println("blo");
//        	List<User>users=userService.allUsers();
//        	for (Long id:userIds) {
//        		for (User u:users) {
//        			if (u.getId()==id) {
//        	        	 userService.blockUser(id);
//        	        	 userRepository.save(u);
//        			}
//        		}
//        	}
        }
        if (action.equals("unblock")){
      		System.out.println("unb");
//        	List<User>users=userService.allUsers();
//        	for (Long id:userIds) {
//        		for (User u:users) {
//        			if (u.getId()==id) {
//        	        	 userService.unblockUser(id);
//        	        	 userRepository.save(u);
//        			}
//        		}
//        	}
        }
        return "redirect:admin";
    }

  }