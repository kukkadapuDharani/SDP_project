package klu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  @Column(name = "id")
  Long id;
  
  @Column(name = "firstname")
  String firstname;
  
  @Column(name = "lastname")
  String lastname;
  
  @Column(name = "mobileno")
  String mobileno;
  
  @Column(name = "emailid")
  String emailid;
  
  @Column(name = "username")
  String username;
  
  @Column(name = "password")
  String password;
  
  public Long getId() {
    return id;
  }
  public void setId(Long id) {
    this.id = id;
  }
  public String getFirstname() {
    return firstname;
  }
  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }
  public String getLastname() {
    return lastname;
  }
  public void setLastname(String lastname) {
    this.lastname = lastname;
  }
  public String getMobileno() {
    return mobileno;
  }
  public void setMobileno(String mobileno) {
    this.mobileno = mobileno;
  }
  public String getEmailid() {
    return emailid;
  }
  public void setEmailid(String emailid) {
    this.emailid = emailid;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  @Override
  public String toString() {
    return "User [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", mobileno=" + mobileno
        + ", emailid=" + emailid + ", username=" + username + ", password=" + password + "]";
  }
}