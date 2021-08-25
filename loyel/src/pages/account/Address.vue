<template>
  <div class="user-details">
    <div class="user-account">
      <div class="account-header">
        <h4 class="pb-2">Address Book</h4>
      </div>
      <div class="row mb-5">
        <div class="col-12">
          <a-card style="width: 100%">
            <UserAddress @change="address"/>
          </a-card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import UserAddress from "@/components/customer/UserAddress";

export default {
  components: {UserAddress},
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
