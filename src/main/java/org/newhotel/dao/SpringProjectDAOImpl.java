package org.newhotel.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.newhotel.entity.Customers;
import org.newhotel.entity.Orders;
import org.newhotel.entity.Rooms;
import org.newhotel.entity.ServiceType;
import org.newhotel.entity.TypeRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import static com.sun.corba.se.impl.util.Utility.printStackTrace;

@Repository
@Transactional
public class SpringProjectDAOImpl implements SpringProjectDAO{
	@Autowired
	SessionFactory sessionFactory;
	
	public List<TypeRoom> readTypeRoom() {
        Session session = sessionFactory.getCurrentSession();
        List<TypeRoom> list = null;
        try {
            list = session.createQuery("from TypeRoom").list();
        } catch (Exception e) {
            printStackTrace();
        }
        return list;
	}
	
	public List<ServiceType> readServiceType() {
		return sessionFactory.getCurrentSession().createQuery("from ServiceType").list();
		
	}
	
	public List<Customers> readCustomers() {
        Session session = sessionFactory.getCurrentSession();
        List<Customers> list = null;
        try {
            list = session.createQuery("from Customers").list();
        } catch (Exception e) {
            printStackTrace();
        }
        return list;
	}
	
	public List<Orders> readOrders() {
		return sessionFactory.getCurrentSession().createQuery("from Orders").list();
		
	}
	/*
	 * 
	 * **/
	public void storeOrder (Orders saveOrders){
        Session session = sessionFactory.getCurrentSession();
        try {
		    session.save(saveOrders);
        } catch (Exception e) {
            printStackTrace();
        }
	}
	
	public List<Rooms> readRooms() {
		return sessionFactory.getCurrentSession().createQuery("from Rooms").list();
		
	}
	
	public Rooms readRoom(int id){
		List<Rooms> r = sessionFactory.getCurrentSession().createQuery("from Rooms where id = " + id).list();
		return r.get(0);
	}

    public List<Rooms> readRoomForType(int typeRoomId){
        return sessionFactory.getCurrentSession().createQuery("from Rooms where typeRoom.id=:id")
                .setParameter("id",typeRoomId)
                .list();
    }
	public Customers readCustomer(int id){
		List<Customers> r = sessionFactory.getCurrentSession().createQuery("from Customers where id = " + id).list();
		return r.get(0);
	}

    @Override
    public List<TypeRoom> getAllRooms() {
        List<TypeRoom> typeRooms = sessionFactory.getCurrentSession().createQuery("from TypeRoom").list();
        return typeRooms;
    }

}
