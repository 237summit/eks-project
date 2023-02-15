import http from "../http-common";

class HotelDataService {
  getAll() {
    return http.get("/hotelapi");
  }


  // get(id) {
  //   return http.get(`/hotelapi/${id}`);
  // }

  create(data) {
    return http.post("/hotelapi", data);
  }

//   update(id, data) {
//     return http.put(`/tutorials/${id}`, data);
//   }

  // delete(id) {
  //   return http.delete(`/hotelapi/${id}`);
  // }

  deleteAll() {
    return http.delete(`/hotelapi`);
  }

//   findByTitle(title) {
//     return http.get(`/tutorials?title=${title}`);
//   }


//   hotelsgetall() {
//     return http.get("/hotels");
//   }

}



export default new HotelDataService();