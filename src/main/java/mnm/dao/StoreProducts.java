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

/**
 *
 * @author mohammadghasemy
 */
@Entity
@Table(name = "store_products")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StoreProducts.findAll", query = "SELECT s FROM StoreProducts s"),
    @NamedQuery(name = "StoreProducts.findById", query = "SELECT s FROM StoreProducts s WHERE s.id = :id"),
    @NamedQuery(name = "StoreProducts.findByName", query = "SELECT s FROM StoreProducts s WHERE s.name = :name"),
    @NamedQuery(name = "StoreProducts.findByVaziat", query = "SELECT s FROM StoreProducts s WHERE s.vaziat = :vaziat"),
    @NamedQuery(name = "StoreProducts.findByPrice", query = "SELECT s FROM StoreProducts s WHERE s.price = :price"),
    @NamedQuery(name = "StoreProducts.findByImgsrc", query = "SELECT s FROM StoreProducts s WHERE s.imgsrc = :imgsrc")})
public class StoreProducts implements Serializable {

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
    @Column(name = "vaziat")
    private int vaziat;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 2147483647)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "price")
    private String price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "imgsrc")
    private String imgsrc;

    public StoreProducts() {
    }

    public StoreProducts(Integer id) {
        this.id = id;
    }

    public StoreProducts(Integer id, String name, int vaziat, String description, String price, String imgsrc) {
        this.id = id;
        this.name = name;
        this.vaziat = vaziat;
        this.description = description;
        this.price = price;
        this.imgsrc = imgsrc;
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

    public int getVaziat() {
        return vaziat;
    }

    public void setVaziat(int vaziat) {
        this.vaziat = vaziat;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImgsrc() {
        return imgsrc;
    }

    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
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
        if (!(object instanceof StoreProducts)) {
            return false;
        }
        StoreProducts other = (StoreProducts) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.StoreProducts[ id=" + id + " ]";
    }
    
}
