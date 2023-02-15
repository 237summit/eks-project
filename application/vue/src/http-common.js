import axios from "axios";

export default axios.create({

  baseURL: "https://back.btc-awesome.site/api",

  headers: {
    "Content-type": "application/json"
  }
});
