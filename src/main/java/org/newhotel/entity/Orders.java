package org.newhotel.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="orders")
public class Orders {

	@Id
	@GeneratedValue
	private Integer id;

	private  String surname;
	
	private  String name;
	
	private  String middlename;
	
	@Column(name ="date_arrival")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date dateArrival;

	@Column(name ="date_departure")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date dateDeparture;
	
	@Column(name ="date_order")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date dateOrder;

	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customers customer;
	
	@ManyToOne
	@JoinColumn(name="id_room")
	private Rooms room;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMiddlename() {
		return middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public java.util.Date getDateArrival() {
		return dateArrival;
	}

	public void setDateArrival(java.util.Date dateArrival) {
		this.dateArrival = dateArrival;
	}

	public java.util.Date getDateDeparture() {
		return dateDeparture;
	}

	public void setDateDeparture(java.util.Date dateDeparture) {
		this.dateDeparture = dateDeparture;
	}


	public Customers getCustomer() {
		return customer;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public Rooms getRoom() {
		return room;
	}

	public void setRoom(Rooms room) {
		this.room = room;
	}

	public java.util.Date getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(java.util.Date dateOrder) {
		this.dateOrder = dateOrder;
	}

}
