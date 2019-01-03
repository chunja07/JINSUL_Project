package js.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.model.*;
import js.user.DAO.*;


@Service
public class UserService {
	
	@Autowired
	private UserDAO userdao;
	
}
