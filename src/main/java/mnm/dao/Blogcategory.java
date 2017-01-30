/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.dao;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 *
 * @author mohammadghasemy
 */
@Entity
@Table(name = "blogcategory")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Blogcategory.findAll", query = "SELECT b FROM Blogcategory b"),
    @NamedQuery(name = "Blogcategory.findById", query = "SELECT b FROM Blogcategory b WHERE b.id = :id"),
    @NamedQuery(name = "Blogcategory.findByName", query = "SELECT b FROM Blogcategory b WHERE b.name = :name"),
    @NamedQuery(name = "Blogcategory.findByLevel", query = "SELECT b FROM Blogcategory b WHERE b.level = :level")})
public class Blogcategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 200)
    @Column(name = "name")
    private String name;
    @Column(name = "level")
    private Integer level;

    public Blogcategory() {
    }

    public Blogcategory(Integer id) {
        this.id = id;
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

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
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
        if (!(object instanceof Blogcategory)) {
            return false;
        }
        Blogcategory other = (Blogcategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.Blogcategory[ id=" + id + " ]";
    }
    
}
