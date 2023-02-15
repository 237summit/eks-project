package com.bezkoder.spring.datajpa.model;

import javax.persistence.*;

@Entity
@Table(name = "hotelapi")
public class Hotel {
   @Id
   @Column(name = "BIZPLC")
   private String BIZPLC;

   @Column(name = "LICENSG")
   private long LICENSG;

   @Column(name = "LOTNOADDR")
   private String LOTNOADDR;

   @Column(name = "Lati")
   private Double Lati;

   @Column(name = "Longi ")
   private Double Longi;






   public Hotel() {

   }

   public Hotel(String BIZPLC, long LICENSG, String LOTNOADDR, Double Lati, Double Longi) {
      this.BIZPLC = BIZPLC;
      this.LICENSG = LICENSG;
      this.LOTNOADDR = LOTNOADDR;
      this.Lati = Lati;
      this.Longi = Longi;
   }


   public String getBIZPLC() {
      return BIZPLC;
   }

   public void setBIZPLC(String BIZPLC) {
      this.BIZPLC = BIZPLC;
   }


   public long getLICENSG() {
      return LICENSG;
   }

   public void setLICENSG(long LICENSG) {
      this.LICENSG = LICENSG;
   }


   public String getLOTNOADDR() {
      return LOTNOADDR;
   }

   public void setLOTNOADDR(String LOTNOADDR) {
      this.LOTNOADDR = LOTNOADDR;
   }

   public Double getLati() {
      return Lati;
   }

   public void setLati(Double Lati) {
      this.Lati = Lati;
   }

   public Double getLongi() {
      return Longi;
   }

   public void setLongi(Double Longi) {
      this.Longi = Longi;
   }

}
