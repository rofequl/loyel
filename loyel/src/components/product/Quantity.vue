<template>
  <div>
    <vue-numeric-input id="style1" v-model="qty" :min="min" :max="max" @input="update"></vue-numeric-input>
  </div>
</template>

<script>
import VueNumericInput from 'vue-numeric-input'

export default {
  props: {
    value: {
      type: [Number],
      default: 1
    },
    min: {
      type: [Number],
      default: 1
    },
    max: {
      type: [Number],
      default: 9999999
    },
  },
  name: "Quantity",
  data() {
    return {
      qty: this.value,
    }
  },
  methods: {
    update(e) {
      if (isNaN(e)) e = this.min;
      this.$emit('input', e)
    }
  },
  components: {VueNumericInput}
}
</script>

<style>
#style1.vue-numeric-input {
  width: 120px!important;
}

#style1.vue-numeric-input .numeric-input {
  border: 0!important;
  text-align: center!important;
}

#style1.vue-numeric-input .numeric-input:focus {
  outline: 0!important;
}

#style1.vue-numeric-input .btn {
  border-radius: 100px;
  height: 30px;
  width: 30px;
  margin-top: -5px;
  font-size: 12px;
  padding: 0;
}
</style>
