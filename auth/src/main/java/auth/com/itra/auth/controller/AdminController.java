package auth.com.itra.auth.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auth.com.itra.auth.service.UserService;
import auth.com.itra.auth.model.User;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String userList(Model model) {
    	List<User>users=userService.allUsers();
        model.addAttribute("allUsers", users);
        return "admin";
    }
    
    @RequestMapping(value = "/bulk_cdelete")
    public String deleteBulkContact(@RequestParam("cid") Integer[] userIds) {
        userService.delete(userIds);
        return "redirect:admin?act=del";
    }

//    @PostMapping("/admin")
//    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
//                              @RequestParam(required = true, defaultValue = "" ) String action,
//                              Model model) {
//        if (action.equals("delete")){
//            userService.deleteUser(userId);
//        }
//        if (action.equals("block")){
//            userService.blockUser(userId);
//        }
//        if (action.equals("unblock")){
//            userService.unblockUser(userId);
//        }
//        return "redirect:/admin";
//    }

    @GetMapping("/admin/gt/{userId}")
    public String  gtUser(@PathVariable("userId") Long userId, Model model) {
        model.addAttribute("allUsers", userService.usergtList(userId));
        return "admin";
    }
}