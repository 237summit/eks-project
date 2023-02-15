package com.bezkoder.spring.datajpa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PutMapping;
// import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.spring.datajpa.model.Hotel;
import com.bezkoder.spring.datajpa.repository.HotelRepository;





@CrossOrigin(origins = "https://www.btc-awesome.site/")

@RestController
@RequestMapping("/api")
public class HotelController {

    @Autowired
   HotelRepository hotelRepository;

   @GetMapping("/hotelapi")
   public ResponseEntity<List<Hotel>> getBIZPLC(@RequestParam(required = false) String BIZPLC) {
      try {
         List<Hotel> hotels = new ArrayList<Hotel>();

         if (BIZPLC == null)
            hotelRepository.findAll().forEach(hotels::add);
         else
            hotelRepository.findByBIZPLCContaining(BIZPLC).forEach(hotels::add);

         if (hotels.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
         }

         return new ResponseEntity<>(hotels, HttpStatus.OK);
      } catch (Exception e) {
         return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
      }
   }
   // @GetMapping("/hotelapi/{REFINE_LOTNO_ADDR}")
   // public ResponseEntity<Hotel> getREFINE_LOTNO_ADDR(@PathVariable("REFINE_LOTNO_ADDR") String REFINE_LOTNO_ADDR) {
   //    Optional<Hotel> hotelData = hotelRepository.findById(REFINE_LOTNO_ADDR);

   //    if (hotelData.isPresent()) {
   //       return new ResponseEntity<>(hotelData.get(), HttpStatus.OK);
   //    } else {
   //       return new ResponseEntity<>(HttpStatus.NOT_FOUND);
   //    }
   // }
//
   // @PostMapping("/hotels")
   // public ResponseEntity<Hotel> createTutorial(@RequestBody Hotel hotel) {
   //    try {
   //       Hotel _hotel = hotelRepository
   //             .save(new Hotel(hotel.getName(), hotel.getAddress()));
   //       return new ResponseEntity<>(_hotel, HttpStatus.CREATED);
   //    } catch (Exception e) {
   //       return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
   //    }
   // }

   // @PutMapping("/hotels/{id}")
   // public ResponseEntity<Hotel> updateHotel(@PathVariable("id") long id, @RequestBody Hotel hotel) {
   //    Optional<Hotel> hotelData = hotelRepository.findById(id);

   //    if (hotelRepository.isPresent()) {
   //       Hotel _hotel = hotelData.get();
   //       _hotel.setName(hotel.getName());
   //       _hotel.setAddress(hotel.getAddress());
   //       _hotel.setPublished(hotel.isPublished());
   //       return new ResponseEntity<>(hotelRepository.save(_hotel), HttpStatus.OK);
   //    } else {
   //       return new ResponseEntity<>(HttpStatus.NOT_FOUND);
   //    }
   // }

   // @DeleteMapping("/hotelapi/{id}")
   // public ResponseEntity<HttpStatus> deleteHotel(@PathVariable("id") long id) {
   //    try {
   //       hotelRepository.deleteById(id);
   //       return new ResponseEntity<>(HttpStatus.NO_CONTENT);
   //    } catch (Exception e) {
   //       return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   //    }
   // }

   @DeleteMapping("/hotelapi")
   public ResponseEntity<HttpStatus> deleteAllHotels() {
      try {
         hotelRepository.deleteAll();
         return new ResponseEntity<>(HttpStatus.NO_CONTENT);
      } catch (Exception e) {
         return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
      }

   }

   // @GetMapping("/hotelapi/published")
   // public ResponseEntity<List<Hotel>> findByPublished() {
   //    try {
   //       List<Hotel> hotels = hotelRepository.findByPublished(true);

   //       if (hotels.isEmpty()) {
   //          return new ResponseEntity<>(HttpStatus.NO_CONTENT);
   //       }
   //       return new ResponseEntity<>(hotels, HttpStatus.OK);
   //    } catch (Exception e) {
   //       return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
   //    }
   // }

}