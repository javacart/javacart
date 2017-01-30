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
@Table(name = "store_order")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StoreOrder.findAll", query = "SELECT s FROM StoreOrder s"),
    @NamedQuery(name = "StoreOrder.findById", query = "SELECT s FROM StoreOrder s WHERE s.id = :id"),
    @NamedQuery(name = "StoreOrder.findByPrice", query = "SELECT s FROM StoreOrder s WHERE s.price = :price"),
    @NamedQuery(name = "StoreOrder.findByPlan", query = "SELECT s FROM StoreOrder s WHERE s.plan = :plan"),
    @NamedQuery(name = "StoreOrder.findByDescription", query = "SELECT s FROM StoreOrder s WHERE s.description = :description"),
    @NamedQuery(name = "StoreOrder.findByDt", query = "SELECT s FROM StoreOrder s WHERE s.dt = :dt"),
    @NamedQuery(name = "StoreOrder.findByStatus", query = "SELECT s FROM StoreOrder s WHERE s.status = :status"),
    @NamedQuery(name = "StoreOrder.findByIduser", query = "SELECT s FROM StoreOrder s WHERE s.iduser = :iduser"),
    @NamedQuery(name = "StoreOrder.findByRefrenceid", query = "SELECT s FROM StoreOrder s WHERE s.refrenceid = :refrenceid"),
    @NamedQuery(name = "StoreOrder.findByIdserver", query = "SELECT s FROM StoreOrder s WHERE s.idserver = :idserver")})
public class StoreOrder implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "price")
    private String price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "plan")
    private String plan;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "description")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "dt")
    private String dt;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private int status;
    @Basic(optional = false)
    @NotNull
    @Column(name = "iduser")
    private int iduser;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "refrenceid")
    private String refrenceid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "idserver")
    private int idserver;

    public StoreOrder() {
    }

    public StoreOrder(Integer id) {
        this.id = id;
    }

    public StoreOrder(Integer id, String price, String plan, String description, String dt, int status, int iduser, String refrenceid, int idserver) {
        this.id = id;
        this.price = price;
        this.plan = plan;
        this.description = description;
        this.dt = dt;
        this.status = status;
        this.iduser = iduser;
        this.refrenceid = refrenceid;
        this.idserver = idserver;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getRefrenceid() {
        return refrenceid;
    }

    public void setRefrenceid(String refrenceid) {
        this.refrenceid = refrenceid;
    }

    public int getIdserver() {
        return idserver;
    }

    public void setIdserver(int idserver) {
        this.idserver = idserver;
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
        if (!(object instanceof StoreOrder)) {
            return false;
        }
        StoreOrder other = (StoreOrder) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.StoreOrder[ id=" + id + " ]";
    }
    
}
