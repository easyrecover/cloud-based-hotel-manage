/**
 * 
 */
package com.hotel.backend.entity;

/**
 * @author chrzha
 *
 */
public class Facilities {
	
	private String id;
	private String name;
	private String type;
	private String description;
	private Float price;
	private Float away;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getAway() {
		return away;
	}
	public void setAway(Float away) {
		this.away = away;
	}
	
	
	
	

}