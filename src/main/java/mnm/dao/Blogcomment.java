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
@Table(name = "blogcomment")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Blogcomment.findAll", query = "SELECT b FROM Blogcomment b"),
    @NamedQuery(name = "Blogcomment.findById", query = "SELECT b FROM Blogcomment b WHERE b.id = :id"),
    @NamedQuery(name = "Blogcomment.findByBlogId", query = "SELECT b FROM Blogcomment b WHERE b.blogId = :blogId"),
    @NamedQuery(name = "Blogcomment.findByUsername", query = "SELECT b FROM Blogcomment b WHERE b.username = :username"),
    @NamedQuery(name = "Blogcomment.findByContent", query = "SELECT b FROM Blogcomment b WHERE b.content = :content"),
    @NamedQuery(name = "Blogcomment.findByCreatedtime", query = "SELECT b FROM Blogcomment b WHERE b.createdtime = :createdtime")})
public class Blogcomment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "blog_id")
    private Integer blogId;
    @Size(max = 200)
    @Column(name = "username")
    private String username;
    @Size(max = 1000)
    @Column(name = "content")
    private String content;
    @Basic(optional = false)
    @NotNull
    @Column(name = "createdtime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdtime;

    public Blogcomment() {
    }

    public Blogcomment(Integer id) {
        this.id = id;
    }

    public Blogcomment(Integer id, Date createdtime) {
        this.id = id;
        this.createdtime = createdtime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
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
        if (!(object instanceof Blogcomment)) {
            return false;
        }
        Blogcomment other = (Blogcomment) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.Blogcomment[ id=" + id + " ]";
    }
    
}
