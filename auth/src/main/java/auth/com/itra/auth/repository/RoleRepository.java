package auth.com.itra.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import auth.com.itra.auth.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}