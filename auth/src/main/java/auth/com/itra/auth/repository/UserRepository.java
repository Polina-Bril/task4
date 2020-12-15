package auth.com.itra.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import auth.com.itra.auth.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}