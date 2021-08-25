<template>
  <a-modal centered :width="750" :visible="modelOpen" :footer="null"
           @cancel="$emit('closeModel')" :title="NewAddress ? 'Add New Address' : 'Address Book'">
    <UserAddress @change="address"/>
  </a-modal>
</template>

<script>
import UserAddress from "@/components/customer/UserAddress";

export default {
  components: {UserAddress},
  props: ['modelOpen'],
  name: "Address",
  data() {
    return {
      NewAddress: false
    }
  },
  methods: {
    address(e) {
      this.NewAddress = e
    }
  }
}
</script>

<style scoped>

</style>
