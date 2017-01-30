/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mnm.dao;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.math.BigInteger;

/**
 *
 * @author mohammadghasemy
 */
@Entity
@Table(name = "store_order_item")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StoreOrderItem.findAll", query = "SELECT s FROM StoreOrderItem s"),
    @NamedQuery(name = "StoreOrderItem.findById", query = "SELECT s FROM StoreOrderItem s WHERE s.id = :id"),
    @NamedQuery(name = "StoreOrderItem.findByAmount", query = "SELECT s FROM StoreOrderItem s WHERE s.amount = :amount"),
    @NamedQuery(name = "StoreOrderItem.findByProductId", query = "SELECT s FROM StoreOrderItem s WHERE s.productId = :productId"),
    @NamedQuery(name = "StoreOrderItem.findByOrderId", query = "SELECT s FROM StoreOrderItem s WHERE s.orderId = :orderId")})
public class StoreOrderItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Long id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private int amount;
    @Column(name = "product_id")
    private BigInteger productId;
    @Column(name = "order_id")
    private BigInteger orderId;

    public StoreOrderItem() {
    }

    public StoreOrderItem(Long id) {
        this.id = id;
    }

    public StoreOrderItem(Long id, int amount) {
        this.id = id;
        this.amount = amount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public BigInteger getProductId() {
        return productId;
    }

    public void setProductId(BigInteger productId) {
        this.productId = productId;
    }

    public BigInteger getOrderId() {
        return orderId;
    }

    public void setOrderId(BigInteger orderId) {
        this.orderId = orderId;
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
        if (!(object instanceof StoreOrderItem)) {
            return false;
        }
        StoreOrderItem other = (StoreOrderItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.StoreOrderItem[ id=" + id + " ]";
    }
    
}
