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
@Table(name = "blog")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Blog.findAll", query = "SELECT b FROM Blog b"),
    @NamedQuery(name = "Blog.findById", query = "SELECT b FROM Blog b WHERE b.id = :id"),
    @NamedQuery(name = "Blog.findByCategoryId", query = "SELECT b FROM Blog b WHERE b.categoryId = :categoryId"),
    @NamedQuery(name = "Blog.findByTitle", query = "SELECT b FROM Blog b WHERE b.title = :title"),
    @NamedQuery(name = "Blog.findByTitleIntro", query = "SELECT b FROM Blog b WHERE b.titleIntro = :titleIntro"),
    @NamedQuery(name = "Blog.findByContent", query = "SELECT b FROM Blog b WHERE b.content = :content"),
    @NamedQuery(name = "Blog.findByCreatedtime", query = "SELECT b FROM Blog b WHERE b.createdtime = :createdtime"),
    @NamedQuery(name = "Blog.findByPicture", query = "SELECT b FROM Blog b WHERE b.picture = :picture")})
public class Blog implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "categoryId")
    private Integer categoryId;
    @Size(max = 400)
    @Column(name = "title")
    private String title;
    @Size(max = 400)
    @Column(name = "titleIntro")
    private String titleIntro;
    @Size(max = 20000)
    @Column(name = "content")
    private String content;
    @Column(name = "createdtime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdtime;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "picture")
    private String picture;

    public Blog() {
    }

    public Blog(Integer id) {
        this.id = id;
    }

    public Blog(Integer id, String picture) {
        this.id = id;
        this.picture = picture;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitleIntro() {
        return titleIntro;
    }

    public void setTitleIntro(String titleIntro) {
        this.titleIntro = titleIntro;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
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
        if (!(object instanceof Blog)) {
            return false;
        }
        Blog other = (Blog) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.Blog[ id=" + id + " ]";
    }
    
}
