package auth.com.itra.auth.service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import auth.com.itra.auth.model.Role;
import auth.com.itra.auth.model.User;
import auth.com.itra.auth.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	@PersistenceContext
	private EntityManager em;
	@Autowired
	UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);

		if (user == null) {
			throw new UsernameNotFoundException("User not found");
		}

		return user;
	}

	public User findUserById(Long userId) {
		Optional<User> userFromDb = userRepository.findById(userId);
		return userFromDb.orElse(new User());
	}

	public List<User> allUsers() {
		return userRepository.findAll();
	}

	public boolean saveUser(User user) {
		User userFromDB = userRepository.findByUsername(user.getUsername());

		if (userFromDB != null) {
			return false;
		}

		user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
		user.setPassword(user.getPassword());
		userRepository.save(user);
		return true;
	}

	public boolean deleteUser(Long userId) {
		if (userRepository.findById(userId).isPresent()) {
			userRepository.deleteById(userId);
			return true;
		}
		return false;
	}

	public boolean blockUser(Long userId) {
		if (userRepository.findById(userId).isPresent()) {
			findUserById(userId).setBlocked(true);
			return true;
		}
		return false;
	}

	public boolean unblockUser(Long userId) {
		if (userRepository.findById(userId).isPresent()) {
			findUserById(userId).setBlocked(false);
			return true;
		}
		return false;
	}

	public String getStatus(User user) {
		user.setStatus(user.isBlocked() ? "is blocked" : "is active");
		return user.getStatus();
	}
}