package com.bezkoder.spring.datajpa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bezkoder.spring.datajpa.model.Hotel;

public interface HotelRepository extends JpaRepository<Hotel, Long> {
   List<Hotel> findByBIZPLCContaining(String BIZPLC);
} 