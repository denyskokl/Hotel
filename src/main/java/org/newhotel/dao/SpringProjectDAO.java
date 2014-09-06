package org.newhotel.dao;

import java.util.List;

import org.newhotel.entity.Customers;
import org.newhotel.entity.Orders;
import org.newhotel.entity.Rooms;
import org.newhotel.entity.ServiceType;
import org.newhotel.entity.TypeRoom;

public interface SpringProjectDAO {
	public List<TypeRoom> readTypeRoom();
	public List<ServiceType> readServiceType();
	public List<Customers> readCustomers();
	public List<Orders> readOrders();
	public List<Rooms> readRooms();
	public void storeOrder(Orders saveOrders);
	public Rooms readRoom(int id);
    public List<Rooms> readRoomForType(int typeRoomId);
	public Customers readCustomer(int id);
    public List<TypeRoom> getAllRooms();
}

