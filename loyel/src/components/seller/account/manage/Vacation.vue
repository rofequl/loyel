<template>
  <div class="vacation-mode">
    <div class="vacation-mode__title z-title1">Vacation Mode</div>
    <div class="z-sub-txt mb-4">
      Delist your store to make it unavailable for some time.
      <br>
      Your product(s) will not be visible to buyers.
    </div>
    <a-radio-group :default-value="vacation" @change="onChange">
      <a-radio :style="radioStyle" :value="0">
        Vacation Mode Off
      </a-radio>
      <a-radio :style="radioStyle" :value="1">
        Vacation Mode On
      </a-radio>
    </a-radio-group>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Vacation",
  data() {
    return {
      radioStyle: {
        display: 'block',
        height: '30px',
        lineHeight: '30px',
      },
    }
  },
  methods: {
    ...mapActions(['VACATION_UPDATE']),
    onChange(e) {
      this.VACATION_UPDATE({active: e.target.value})
    },
  },
  computed: {
    ...mapGetters(["vacation"])
  }
}
</script>

<style scoped>
.vacation-mode__title {
  margin-bottom: 8px;
}

.z-title1 {
  font-size: 20px;
  line-height: 24px;
  font-weight: 600;
  text-transform: capitalize;
}

.z-sub-txt {
  font-size: 14px;
  line-height: 20px;
  color: #7c7e8a;
}
</style>
