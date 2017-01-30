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
@Table(name = "tickets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Tickets.findAll", query = "SELECT t FROM Tickets t"),
    @NamedQuery(name = "Tickets.findById", query = "SELECT t FROM Tickets t WHERE t.id = :id"),
    @NamedQuery(name = "Tickets.findByFromto", query = "SELECT t FROM Tickets t WHERE t.fromto = :fromto"),
    @NamedQuery(name = "Tickets.findByDtpersian", query = "SELECT t FROM Tickets t WHERE t.dtpersian = :dtpersian"),
    @NamedQuery(name = "Tickets.findByIdproject", query = "SELECT t FROM Tickets t WHERE t.idproject = :idproject"),
    @NamedQuery(name = "Tickets.findByTicketnumber", query = "SELECT t FROM Tickets t WHERE t.ticketnumber = :ticketnumber"),
    @NamedQuery(name = "Tickets.findByIduser", query = "SELECT t FROM Tickets t WHERE t.iduser = :iduser"),
    @NamedQuery(name = "Tickets.findBySubject", query = "SELECT t FROM Tickets t WHERE t.subject = :subject"),
    @NamedQuery(name = "Tickets.findByStatus", query = "SELECT t FROM Tickets t WHERE t.status = :status")})
public class Tickets implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "texts")
    private String texts;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fromto")
    private short fromto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "dtpersian")
    private String dtpersian;
    @Column(name = "idproject")
    private Integer idproject;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "ticketnumber")
    private String ticketnumber;
    @Column(name = "iduser")
    private Integer iduser;
    @Size(max = 255)
    @Column(name = "subject")
    private String subject;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private int status;

    public Tickets() {
    }

    public Tickets(Integer id) {
        this.id = id;
    }

    public Tickets(Integer id, String texts, short fromto, String dtpersian, String ticketnumber, int status) {
        this.id = id;
        this.texts = texts;
        this.fromto = fromto;
        this.dtpersian = dtpersian;
        this.ticketnumber = ticketnumber;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTexts() {
        return texts;
    }

    public void setTexts(String texts) {
        this.texts = texts;
    }

    public short getFromto() {
        return fromto;
    }

    public void setFromto(short fromto) {
        this.fromto = fromto;
    }

    public String getDtpersian() {
        return dtpersian;
    }

    public void setDtpersian(String dtpersian) {
        this.dtpersian = dtpersian;
    }

    public Integer getIdproject() {
        return idproject;
    }

    public void setIdproject(Integer idproject) {
        this.idproject = idproject;
    }

    public String getTicketnumber() {
        return ticketnumber;
    }

    public void setTicketnumber(String ticketnumber) {
        this.ticketnumber = ticketnumber;
    }

    public Integer getIduser() {
        return iduser;
    }

    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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
        if (!(object instanceof Tickets)) {
            return false;
        }
        Tickets other = (Tickets) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mnm.dao.Tickets[ id=" + id + " ]";
    }
    
}
