<template>
  <div>
    <NewAddress v-if="newAddress" @newAddress="newAddress = false"/>
    <AddressList v-else @newAddress="newAddress = true"/>
  </div>
</template>

<script>
import AddressList from "@/components/customer/address/AddressList";
import NewAddress from "@/components/customer/address/NewAddress";

export default {
  name: "UserAddress",
  components: {NewAddress, AddressList},
  data() {
    return {
      newAddress: false
    }
  },
  watch: {
    newAddress: function (e) {
      this.$emit('change', e)
    }
  }
}
</script>

<style scoped>

</style>
