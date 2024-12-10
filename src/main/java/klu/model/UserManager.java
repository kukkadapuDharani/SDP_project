package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import klu.repository.UserRepository;

@Service
public class UserManager {
  
  @Autowired
  UserRepository UR;
  
  public String saveUser(User U)
  {
    try
    {
    	if(UR.validateUsername(U.username)>0)
    		throw new Exception("Username  already exists!");
      UR.save(U);
      return "New user has been added";
    }catch(Exception e)
    {
      return e.getMessage();
    }
  }
  
  public String loginUser(String uname, String pwd)
  {
	  try
	  {
		  if(UR.validateCredentials(uname, pwd)==0)
			 throw new Exception("Invalid Credentials");
		  
		  return "Validation Success";
		  
	  }
	  catch(Exception e)
	  {
		  return e.getMessage();
	  }
	  
	  
  }
}