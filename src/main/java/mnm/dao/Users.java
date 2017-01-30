/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author mohammadghasemy
 */
@Entity
@Table(name = "users")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
    @NamedQuery(name = "Users.findById", query = "SELECT u FROM Users u WHERE u.id = :id"),
    @NamedQuery(name = "Users.findByName", query = "SELECT u FROM Users u WHERE u.name = :name"),
    @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username"),
    @NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
    @NamedQuery(name = "Users.findByTel", query = "SELECT u FROM Users u WHERE u.tel = :tel"),
    @NamedQuery(name = "Users.findByAddress", query = "SELECT u FROM Users u WHERE u.address = :address"),
    @NamedQuery(name = "Users.findByEnabled", query = "SELECT u FROM Users u WHERE u.enabled = :enabled"),
    @NamedQuery(name = "Users.findByGoogleId", query = "SELECT u FROM Users u WHERE u.googleId = :googleId"),
    @NamedQuery(name = "Users.findByGoogleName", query = "SELECT u FROM Users u WHERE u.googleName = :googleName"),
    @NamedQuery(name = "Users.findByGoogleGivenName", query = "SELECT u FROM Users u WHERE u.googleGivenName = :googleGivenName"),
    @NamedQuery(name = "Users.findByGoogleFamilyName", query = "SELECT u FROM Users u WHERE u.googleFamilyName = :googleFamilyName"),
    @NamedQuery(name = "Users.findByGoogleLink", query = "SELECT u FROM Users u WHERE u.googleLink = :googleLink"),
    @NamedQuery(name = "Users.findByGooglePicture", query = "SELECT u FROM Users u WHERE u.googlePicture = :googlePicture"),
    @NamedQuery(name = "Users.findByGoogleGender", query = "SELECT u FROM Users u WHERE u.googleGender = :googleGender"),
    @NamedQuery(name = "Users.findByDtReg", query = "SELECT u FROM Users u WHERE u.dtReg = :dtReg")})
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "tel")
    private String tel;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "address")
    private String address;
    @Basic(optional = false)
    @NotNull
    @Column(name = "enabled")
    private boolean enabled;
    @Size(max = 255)
    @Column(name = "google_id")
    private String googleId;
    @Size(max = 255)
    @Column(name = "google_name")
    private String googleName;
    @Size(max = 255)
    @Column(name = "google_given_name")
    private String googleGivenName;
    @Size(max = 255)
    @Column(name = "google_family_name")
    private String googleFamilyName;
    @Size(max = 255)
    @Column(name = "google_link")
    private String googleLink;
    @Size(max = 255)
    @Column(name = "google_picture")
    private String googlePicture;
    @Size(max = 255)
    @Column(name = "google_gender")
    private String googleGender;
    @Basic(optional = false)
    @NotNull
    @Column(name = "dt_reg")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dtReg;

    public Users() {
    }

    public Users(Integer id) {
        this.id = id;
    }

    public Users(Integer id, String name, String username, String password, String tel, String address, boolean enabled, Date dtReg) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.password = password;
        this.tel = tel;
        this.address = address;
        this.enabled = enabled;
        this.dtReg = dtReg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getGoogleId() {
        return googleId;
    }

    public void setGoogleId(String googleId) {
        this.googleId = googleId;
    }

    public String getGoogleName() {
        return googleName;
    }

    public void setGoogleName(String googleName) {
        this.googleName = googleName;
    }

    public String getGoogleGivenName() {
        return googleGivenName;
    }

    public void setGoogleGivenName(String googleGivenName) {
        this.googleGivenName = googleGivenName;
    }

    public String getGoogleFamilyName() {
        return googleFamilyName;
    }

    public void setGoogleFamilyName(String googleFamilyName) {
        this.googleFamilyName = googleFamilyName;
    }

    public String getGoogleLink() {
        return googleLink;
    }

    public void setGoogleLink(String googleLink) {
        this.googleLink = googleLink;
    }

    public String getGooglePicture() {
        return googlePicture;
    }

    public void setGooglePicture(String googlePicture) {
        this.googlePicture = googlePicture;
    }

    public String getGoogleGender() {
        return googleGender;
    }

    public void setGoogleGender(String googleGender) {
        this.googleGender = googleGender;
    }

    public Date getDtReg() {
        return dtReg;
    }

    public void setDtReg(Date dtReg) {
        this.dtReg = dtReg;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.Users[ id=" + id + " ]";
    }
    
}
