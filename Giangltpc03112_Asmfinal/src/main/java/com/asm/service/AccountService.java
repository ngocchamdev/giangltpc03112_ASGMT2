package com.asm.service;

import java.util.List;

import com.asm.model.Account;
import com.asm.model.Brand;
import com.asm.model.Role;
import com.asm.model.RoleDetail;

public interface AccountService {

	List<Account> findAll();
	
	Account findByUsername(String username);
	
	Account save(Account account);
	
	void deleteByUsername(String username);

	boolean existsById(String username);

	List<Account> findByFullname(String fullname);

	List<Role> findAllRole();

	List<RoleDetail> findAllAuthorities();

	RoleDetail saveRoleDetail(RoleDetail authority);

	void deleteRoleDetail(Long id);

	List<Account> findByUsernameLike(String username);

	Long countCustomer(String role);
	

}
