package org.newhotel.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="service_type")
public class ServiceType {
	@Id
	@GeneratedValue
	private Integer id;

	private  String name;
	
	private  Integer price;
	
	@Column(name="type_count")
	private String typeCount;

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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getTypeCount() {
		return typeCount;
	}

	public void setTypeCount(String typeCount) {
		this.typeCount = typeCount;
	}

}
