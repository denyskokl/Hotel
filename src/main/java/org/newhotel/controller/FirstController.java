package org.newhotel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.newhotel.dao.SpringProjectDAO;
import org.newhotel.entity.Customers;
import org.newhotel.entity.Orders;
import org.newhotel.entity.Rooms;
import org.newhotel.entity.ServiceType;
import org.newhotel.entity.TypeRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FirstController {
	@Autowired
	SpringProjectDAO dao;
	
	@RequestMapping("/start.do")
	public ModelAndView start(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("registrationOrder");
        List<TypeRoom> roomType = dao.getAllRooms();
        request.getSession().setAttribute("typeRoom", roomType);
		return mav;
	}
	
	@RequestMapping(value = "/registrationOrder.do", method = RequestMethod.POST)
	public ModelAndView registrationOrder(@RequestParam String surname, @RequestParam String name, 
			@RequestParam String middlename, @RequestParam String dataArrival,
			@RequestParam String dataDeparture, @RequestParam String dataOrder,
            @RequestParam Integer roomId, HttpServletRequest request){
		ModelAndView mav=new ModelAndView("registrationOrder");
		Orders order = new Orders();
		Date dateArrivalOrders = null;
		Date dateDepartureOrders = null;
		Date dateOrderOrders = null;
        Rooms room = dao.readRoom(roomId);
		try {
			dateArrivalOrders = new SimpleDateFormat("yyyy-MM-dd").parse(dataArrival);
			dateDepartureOrders = new SimpleDateFormat("yyyy-MM-dd").parse(dataDeparture);
			dateOrderOrders  = new SimpleDateFormat("yyyy-MM-dd").parse(dataOrder);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		order.setSurname(surname);
		order.setName(name);
		order.setMiddlename(middlename);
		order.setDateArrival(dateArrivalOrders);
		order.setDateDeparture(dateDepartureOrders);
		order.setDateOrder(dateOrderOrders);
		order.setCustomer(dao.readCustomer(1));
        order.setRoom(room);
		dao.storeOrder(order);
		
		return mav;
	}
	@RequestMapping("/typeRoom.do")
	public ModelAndView typeRoom(){
		ModelAndView mav=new ModelAndView("typeRoom");
		List<TypeRoom> typeRoom = dao.readTypeRoom();
		mav.addObject("typeRoom",typeRoom);
		return mav;
	}
	
	@RequestMapping("/serviceType.do")
	public ModelAndView serviceType(){
		ModelAndView mav=new ModelAndView("serviceType");
		List<ServiceType> serviceType = dao.readServiceType();
		mav.addObject("serviceTypes",serviceType);
		return mav;
	}
	
	@RequestMapping("/customers.do")
	public ModelAndView customers(){
		ModelAndView mav=new ModelAndView("customers");
		List<Customers> customers = dao.readCustomers();
		mav.addObject("customerss",customers);
		return mav;
	}
	
	@RequestMapping("/orders.do")
	public ModelAndView orders(){
		ModelAndView mav=new ModelAndView("orders");
		List<Orders> orderss = dao.readOrders();
		mav.addObject("orderss",orderss);
		return mav;
	}
	
	@RequestMapping("/rooms.do")
	public ModelAndView rooms(){
		ModelAndView mav=new ModelAndView("rooms");
		List<Rooms> roomss = dao.readRooms();
		mav.addObject("roomss",roomss);
		return mav;
	}

    @RequestMapping("/roomsForType.do")
    public ModelAndView roomsForType(@RequestParam int typeRoomId){
        ModelAndView mav=new ModelAndView("roomsForType");
        List<Rooms> rooms = dao.readRoomForType(typeRoomId);
        mav.addObject("rooms",rooms);
        return mav;
    }
}
