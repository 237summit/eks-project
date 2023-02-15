<template>
<!--  <div class="hello">-->
  <div :style="{'background-image':'url(https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fmg110100mat%2Fcoming-soon%2F&psig=AOvVaw2YDf5T5PwcG01OuFRlqU91&ust=1670662719610000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMCN2OGV7PsCFQAAAAAdAAAAABAJ)'}" class="hello">
    <br/> <br/> <br/> <br/> <br/>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

    <h1>AWeSome♡</h1>
    <h2>Aws 3팀</h2>
    <ul>
      <li>
        <a
            href="/"
            target="_self"
            rel="noopener"
        >Are you Ready??</a>
      </li>

    </ul>
  </div>
</template>

<script>
export default {
  name: "introLogin",
  props: {
    msg: String
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 20px 0 0;
  color: white;
}
ul {
  list-style-type: none;
  padding: 0;
  background-color: #000000;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #ffdf7e;
  font-size: 20px;
  font-style: italic;
  padding-top: 2px;
}
.hello {
  margin: 0px auto;
  background-color: white;
  padding: 40px 40px;
  border-radius: 8px;
  max-width: 600px;
}
</style>
