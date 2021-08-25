<template>
  <div class="ending-in mt-1">
    <span class="bg-success text-white p-1 rounded">{{ days }}</span> :
    <span class="bg-success text-white p-1 rounded">{{ hours }}</span> :
    <span class="bg-success text-white p-1 rounded">{{ minutes }}</span> :
    <span class="bg-success text-white p-1 rounded">{{ seconds }}</span>
  </div>
</template>

<script>
export default {
  name: "Timer",
  props: {
    endtime: {
      required: true
    },
  },
  data: function () {
    return {
      starttime: new Date().getTime(),
      timer: "",
      wordString: {},
      start: "",
      end: "",
      interval: "",
      days: "",
      minutes: "",
      hours: "",
      seconds: "",
      message: "",
      statusType: "",
      statusText: "",

    };
  },
  created: function () {

  },
  mounted() {
    this.start = new Date(this.starttime).getTime();
    this.end = new Date(this.endtime).getTime();
    this.timerCount(this.start, this.end);
    this.interval = setInterval(() => {
      this.timerCount(this.start, this.end);
    }, 1000);
  },
  methods: {
    timerCount: function (start, end) {
      // Get todays date and time
      var now = new Date().getTime();

      // Find the distance between now an the count down date
      var distance = start - now;
      var passTime = end - now;

      if (distance < 0 && passTime < 0) {
        clearInterval(this.interval);
        return;

      } else if (distance < 0 && passTime > 0) {
        this.calcTime(passTime);

      } else if (distance > 0 && passTime > 0) {
        this.calcTime(distance);
      }
    },
    calcTime: function (dist) {
      // Time calculations for days, hours, minutes and seconds
      this.days = ("0" + Math.floor(dist / (1000 * 60 * 60 * 24))).slice(-2);
      this.hours = ("0" + Math.floor((dist % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))).slice(-2);
      this.minutes = ("0" + Math.floor((dist % (1000 * 60 * 60)) / (1000 * 60))).slice(-2);
      this.seconds = ("0" + Math.floor((dist % (1000 * 60)) / 1000)).slice(-2);
    }
  }
}
</script>

<style scoped>

</style>
